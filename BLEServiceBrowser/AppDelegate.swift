//
//  AppDelegate.swift
//  BLEServiceBrowser
//
//  Created by Hiteshwar Vadlamudi on 11/30/15.
//  Copyright © 2015 bluetooth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var splitViewController: UISplitViewController?
    var mainViewController: MainViewController?
    var deviceViewController: DeviceViewController?
    var serviceViewController: ServiceViewController?
    var charViewController: CharViewController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if(UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad){
            splitViewController = self.window?.rootViewController as? UISplitViewController
            let navController = self.splitViewController?.viewControllers[0] as? UINavigationController
            
            mainViewController = navController?.topViewController as? MainViewController
            splitViewController?.delegate = navController?.topViewController as? UISplitViewControllerDelegate
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func setMainViewDelegate(_ controller: DeviceViewController){
        if(UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad){
            mainViewController?.delegate = controller
            deviceViewController = controller
            self.splitViewController?.delegate = controller
            
        }
    }
    
    func setServiceViewDelegate(_ controller: ServiceViewController){
        if(UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad){
            deviceViewController?.delegate = controller
            serviceViewController = controller
            self.splitViewController?.delegate = controller
        }
    }
    
    func setCharViewDelegate(_ controller: CharViewController){
        if(UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad){
            serviceViewController?.delegate = controller
            self.splitViewController?.delegate = controller
        }
    }
    
    func clearViewControllers(){
        if(UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad){
            let detailNavCtrl = self.splitViewController?.viewControllers[1] as! UINavigationController
            detailNavCtrl.popToViewController(deviceViewController!, animated: true)
            splitViewController?.delegate = detailNavCtrl.topViewController as? UISplitViewControllerDelegate
        }
    }

}

