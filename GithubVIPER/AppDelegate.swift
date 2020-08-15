//
//  AppDelegate.swift
//  GithubVIPER
//
//  Created by Mena Gamal on 8/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import Network
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CacheHandler.shared.fetchCache()
        reachibity()
        return true
    }
    func reachibity() {
        if #available(iOS 12.0, *) {
            let monitor = NWPathMonitor()
            monitor.pathUpdateHandler = { path in
                // self.showInternetStatus(path.status == .satisfied)
                NotificationCenter.default.post(name: .onRechabilityChanged, object: path.status == .satisfied)
            }
            let queue = DispatchQueue(label: "Monitor")
            monitor.start(queue: queue)
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

