//
//  AppDelegate.swift
//  ALCameraViewController
//
//  Created by Alex Littlejohn on 2015/06/17.
//  Copyright (c) 2015 zero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if #available(iOS 13.0, *) {
            let viewController = ViewController(nibName: "ViewController", bundle: Bundle.main)
            window = UIWindow(frame: UIScreen.main.bounds)
            window!.rootViewController = viewController
            window!.makeKeyAndVisible()
          
        } else {
            // Fallback on earlier versions
        }
        
        return true
    }
}
