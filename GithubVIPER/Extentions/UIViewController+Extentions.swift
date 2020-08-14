//
//  UIViewController+Extentions.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    class func instanceXib<T: UIViewController>() -> T {
        return T(nibName: T.identifier, bundle: nil)
    }
    
}
