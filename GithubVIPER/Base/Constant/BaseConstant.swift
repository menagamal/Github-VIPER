//
//  BaseConstant.swift
//  Customer
//
//  Created by CARNVAL on 5/20/20.
//  Copyright © 2020 waqood. All rights reserved.
//

import Foundation

enum BaseConstant {
    
    static let baseUrl = "https://api.github.com/"
    
    enum Codes: Int {
        case success = 200
        case failure = 404
        case unAuthorized = 401
    }
    
     enum HTTPHeaderField: String {
        case ContentType = "Content-Type"
        case Accept = "Accept"
        case AcceptLanguage = "Accept-Language"
        case Authorization = "Authorization"
    }
    
     enum ContentType :String{
        case json = "application/json"
        case multiPart = "application/x-www-form-urlencoded"
    }
    
    
}


var deviceToken: String{
    if let deviceToken = UserDefaults.standard.value(forKey: "fcmToken") as? String {
        return deviceToken
    }
    return ""
}

