//
//  BasePresenter.swift
//  Customer
//
//  Created by CARNVAL on 5/20/20.
//  Copyright © 2020 waqood. All rights reserved.
//

import Foundation

protocol BasePresenterProtocol {
    func present(message: String)
    func unAuthorized()
}
class BasePresenter {
    weak var baseView: BaseViewProtocol?
}

extension BasePresenter: BasePresenterProtocol {
    
    func unAuthorized() {
        baseView?.unAuthorized()
    }
    
    func present(message: String) {
        baseView?.hideLoadingIndicator()
        baseView?.hideLoadingRefresher()
        baseView?.display(message: message)
    }
}

