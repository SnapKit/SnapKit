//
//  AppDelegate.swift
//  ExpressiveLayout
//
//  Created by Jonas Budelmann on 5/06/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        
        let navigationController = UINavigationController(rootViewController: RootViewController())
        self.window!.rootViewController = navigationController
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }
}

