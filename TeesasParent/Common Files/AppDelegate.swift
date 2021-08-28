//  AppDelegate.swift
//  TeesasParent
//  Created by iOS-Appentus on 23/March/2020.
//  Copyright © 2020 appentus. All rights reserved.


import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13, *) {
            window!.overrideUserInterfaceStyle = .light
        }
        return true
    }

   
}

