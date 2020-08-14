//
//  AppTarget.swift
//  Coins
//
//  Created by Mena Gamal on 7/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import Moya


enum AppTarget {
  
}

extension AppTarget: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: BaseConstant.baseUrl) else {
            preconditionFailure("Invalid url")
        }
        return url
    }
    
    var path: String {
//        switch self {
//        case .updateProfile:
//            return AppTargetConstant.EndPoint.updateProfile
//        case .wallet:
//            return AppTargetConstant.EndPoint.wallet
//        case .verifyCustomerNumber:
//            return AppTargetConstant.EndPoint.verifyCustomerNumberAmount
//        case .setCustomerNumberAmount:
//            return AppTargetConstant.EndPoint.setCustomerNumberAmount
//        }
        return ""
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method{
//        switch self {
//        case .wallet:
//            return .get
//        case .verifyCustomerNumber,.setCustomerNumberAmount,.updateProfile:
//            return .post
//        }
        return .get
    }
    
    var task: Task {
        return .requestPlain
//        switch self {
//        case .wallet:
//            return .requestPlain
//
//        }
    }
    
    var headers: [String : String]? {
//        let token = UserDefaultsHandler().getUserToken()
//        let authorized: [String: String] = [
//
//            BaseConstant.HTTPHeaderField.Accept.rawValue: BaseConstant.ContentType.json.rawValue,
//            BaseConstant.HTTPHeaderField.ContentType.rawValue: BaseConstant.ContentType.json.rawValue,
//            BaseConstant.HTTPHeaderField.Authorization.rawValue: "Bearer \(token)"]
        return [String: String]()
    }
    
}
