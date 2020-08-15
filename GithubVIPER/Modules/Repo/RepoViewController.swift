//
//  RepoViewController.swift
//  GithubVIPER
//
//  Created Mena Gamal on 8/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit


class RepoViewController: BaseViewController, RepoViewProtocol {
    
    @IBOutlet weak var seg: UISegmentedControl!
    @IBOutlet weak var repoTableView: UITableView!
    @IBOutlet weak var controlFrameView: UIView!
    var presenter: RepoPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seg.selectedSegmentTintColor = Palette.slateGrey
        seg.tintColor = Palette.slateGrey
        seg.ensureiOS12Style()
        self.presenter?.presenterViewDidLoad()
        self.presenter?.loadRepos(timeframe: .Day)
    }
    
    @IBAction func onSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.presenter?.loadRepos(timeframe: .Day)
            break
        case 1:
            self.presenter?.loadRepos(timeframe: .Week)
            break
        case 2:
            self.presenter?.loadRepos(timeframe: .Month)
            break
        default:
            break
        }
    }
    
}
