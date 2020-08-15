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
    case fetchRepos(query:String,page:Int)
}

extension AppTarget: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: BaseConstant.baseUrl) else {
            preconditionFailure("Invalid url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchRepos:
            return AppTargetConstant.EndPoint.fetchRepos
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method{
        return .get
    }
    
    var task: Task {
        
        switch self {
        case .fetchRepos(let query, let page):
            let parameters: [String: Any] = [AppTargetConstant.Parameters.query: query,
                                             AppTargetConstant.Parameters.sort: AppTargetConstant.Constants.stars,
                                             AppTargetConstant.Parameters.order: AppTargetConstant.Constants.desc,
                                             AppTargetConstant.Parameters.page: page
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            
        }
    }
    
    var headers: [String : String]? {
        let headers: [String: String] = [
            BaseConstant.HTTPHeaderField.Accept.rawValue: BaseConstant.ContentType.json.rawValue,
            BaseConstant.HTTPHeaderField.ContentType.rawValue: BaseConstant.ContentType.json.rawValue,
        ]
        return headers
    }
    
}
