//
//  AppDelegate.swift
//  Example-iOS
//
//  Created by Spiros Gerokostas on 01/03/16.
//  Copyright © 2016 SnapKit Team. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)

        let listViewController:ListViewController = ListViewController()
        let navigationController:UINavigationController = UINavigationController(rootViewController: listViewController);

        self.window!.rootViewController = navigationController;
 
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        
        return true
    }
}
