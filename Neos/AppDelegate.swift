//
//  AppDelegate.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/13/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenterDistribute
import Keys

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        var keys = NeosKeys();
        
        #if DEBUG
            MSAppCenter.start(keys.appCenterSecret, withServices:[
                MSAnalytics.self,
                MSCrashes.self
                ])
        #else
            MSAppCenter.start(keys.appCenterSecret, withServices: [MSAnalytics.self,
                                                               MSCrashes.self,
                                                               MSDistribute.self])
        #endif
        
        return true
    }


}

