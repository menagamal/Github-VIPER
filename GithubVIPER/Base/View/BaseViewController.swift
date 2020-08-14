//
//  BaseViewController.swift
//  Customer
//
//  Created by CARNVAL on 5/20/20.
//  Copyright © 2020 waqood. All rights reserved.
//

import UIKit

protocol BaseViewProtocol: class {
    func display(message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showLoadingRefresher()
    func hideLoadingRefresher()
    func unAuthorized()
}

class BaseViewController: UIViewController {
    @IBOutlet weak var backBtn: UIButton!
    
    private var indicator: CActivityIndicator!
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator = CActivityIndicator()
    }
}

extension BaseViewController: BaseViewProtocol {
    func setNavigation()  {
        UINavigationBar.appearance().tintColor = UIColor.white //your desired color here
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -12, vertical: 0), for: .default)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async {
            self.indicator.start()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.indicator.stop()
        }
    }
    
    func showLoadingRefresher() {
        DispatchQueue.main.async {
            self.refresher.beginRefreshing()
        }
    }
    
    func hideLoadingRefresher() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                    //    self.refresher.endRefreshing()

        })
    }
    
    func display(message: String) {
        print(message)
        show(message: message)
    }
    
    func unAuthorized() {
        #warning("Implement UNAUTH")
//        rootToLogin()
    }
    
    @IBAction func goToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension BaseViewController {
    private func show(message: String) {
        DispatchQueue.main.async {
            var alert = UIAlertController()
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(ok)
            self.present(alert,animated: true)
        }
    }
}
