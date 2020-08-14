//
//  BaseConfig.swift
//  Customer
//
//  Created by CARNVAL on 5/20/20.
//  Copyright © 2020 waqood. All rights reserved.
//

import Foundation

class BaseConfig {
    
    func handleBasePresenter(baseView: BaseViewController) -> BasePresenter {
        let basePresenter = BasePresenter()
        basePresenter.baseView = baseView
        return basePresenter
    }
    
}
