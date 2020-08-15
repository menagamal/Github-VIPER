//
//  BaseInteractor.swift
//  Customer
//
//  Created by CARNVAL on 5/20/20.
//  Copyright © 2020 waqood. All rights reserved.
//

import Foundation
import Moya

class BaseInteractor<MoyaTarget: TargetType> {
    var basePresenter: BasePresenterProtocol?
    let provider = MoyaProvider<MoyaTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
}

extension BaseInteractor {
    func request<T:Decodable>(targetType: MoyaTarget, completion: @escaping (T) -> Void) {
        provider.request(targetType.debugLog()) { result in
            switch(result) {
            case .success(let response):
                do {
                    
                    let decodableResponse = try response.debugLog().map(T.self)
                    DispatchQueue.main.async {
                        completion(decodableResponse)
                    }
                    
                }
                catch {
                    print(error)
                    self.basePresenter?.present(message: error.localizedDescription)
                }
            case .failure(let error):
                print(error)
                self.basePresenter?.present(message: error.localizedDescription)
            }
        }
    }
    
}

extension TargetType {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("=======================================")
        debugPrint(self)
        print("Base Url =============", baseURL)
        print("Path =================", path)
        print("URL ==================", baseURL,path)
        print("HTTP Method ==========", method.rawValue)
        print("Task =================", task)
        print("Headers ==============", headers ?? "No Headers")
        debugPrint("=======================================")
        #endif
        return self
    }
}

extension Response {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("=======================================")
        debugPrint(self)
        //debugPrint(JSON(self.data))
        debugPrint("=======================================")
        #endif
        return self
    }
}

