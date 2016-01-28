//
//  AppDelegate.swift
//  SwiftRun
//
//  Created by Mike Henry on 1/28/16.
//  Copyright © 2016 Mike Henry. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.setApplicationId("Fsa1SQOSHIa1Er6rkI2EQaFm6zmwWAg5I5TzSDDf",
            clientKey: "bawStXkUX7eE96XEyw707WrpUoTLqUk9C2NeeLq2")

        return true
    }

}

