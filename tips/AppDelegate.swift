//
//  AppDelegate.swift
//  tips
//
//  Created by yeung wah tsui on 12/13/15.
//  Copyright © 2015 yeung wah tsui. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var date: NSDate?
    var newDate: NSDate?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        let calendar = NSCalendar.currentCalendar()

        date = NSDate();
        newDate = calendar.dateByAddingUnit(
            .Second, // adding hours
            value: 1, // adding two hours
            toDate: date!,
            options: [ ]
        );
        print("resign action \(date) \(newDate)");
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("did enter background");
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
        
        print("will enter foreground");
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("become action");
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        let defaults = NSUserDefaults.standardUserDefaults();
        print("become terminate");
                date = NSDate()
        if date!.compare(newDate!) == NSComparisonResult.OrderedDescending
        {
            var myViewController : ViewController!
            if let viewControllers = self.window?.rootViewController?.childViewControllers {
                for viewController in viewControllers {
                    if viewController.isKindOfClass(ViewController) {
                        myViewController = viewController as! ViewController
                        defaults.setInteger(1, forKey: "firstRun");
                        defaults.setObject(myViewController.billField.text, forKey: "billField");
                        defaults.setObject(myViewController.tipLabel.text, forKey: "tipLabel");
                        defaults.setObject(myViewController.totalLabel.text, forKey: "totalLabel");
                        defaults.setObject(myViewController.perPersonLabel.text, forKey: "perPersonLabel");
                        defaults.setObject(myViewController.peopleLabel.text, forKey: "peopleLabel");
                        defaults.synchronize();
                        print("Found the view controller")
                    }
                }
            }
        }
        
    }


}

