//
//  Reachability.swift
//  GithubVIPER
//
//  Created by Mena Gamal on 8/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
import Foundation
import Network

class Reachability {
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "InternetConnectionMonitor")
    
    func checkForInternet(action:@escaping((Bool) -> Void)) {
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
                action(true)
            } else {
                print("There's no internet connection.")
                action(false)
            }
        }
        
        monitor.start(queue: queue)
    }
    
}
