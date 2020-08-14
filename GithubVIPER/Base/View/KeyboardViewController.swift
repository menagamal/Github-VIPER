//
//  KeyboardViewController.swift
//  LabOnClick
//
//  Created by Mustafa Ezzat on 7/13/19.
//  Copyright © 2019 Waqood. All rights reserved.
//

import UIKit

class KeyboardViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
}


// Put this piece of code anywhere you like
extension KeyboardViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension KeyboardViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view else {
            return false
        }
        if view.isKind(of: UIControl.self) {
            return false
        }
        return true
    }
}
