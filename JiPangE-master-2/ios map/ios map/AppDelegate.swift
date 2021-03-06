//
//  AppDelegate.swift
//  ios map
//
//  Created by cscoi054 on 2017. 1. 24..
//  Copyright © 2017년 a. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain


class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var coreLocationController : CoreLocationController?

    var window: UIWindow?
    var locationManager: CLLocationManager!
    var seenError : Bool = false
    var locationFixAchieved:Bool = false
    var locationStatus : NSString = "Not started"


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        initLocationManaer();
        return true
    }
        
        
//        [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        return true
//    }

    
    func initLocationManaer(){
        seenError = false
        locationFixAchieved = false
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(manager:CLLocationManager, didFailWithError error : NSError){
        locationManager.stopUpdatingLocation()
        
        if (seenError == false){
            seenError = true
            print(error)
        }
    }
    
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations : [CLLocation]){
        
        if (locationFixAchieved == false){
            locationFixAchieved = true
            let locationArray = locations as NSArray
            let locationObj = locationArray.lastObject as! CLLocation
            let coord = locationObj.coordinate
            
            print(coord.latitude)
            print(coord.longitude)
        }
    }
        
        
        func locationManager(manager:CLLocationManager, didChangeAuthorizationStatus status : CLAuthorizationStatus){
            var shouldIAllow = false
            
            switch status {
            case CLAuthorizationStatus.restricted:
                locationStatus = "Restricted Access to location"
            case CLAuthorizationStatus.denied:
                locationStatus = "User denied access to location"
            case CLAuthorizationStatus.notDetermined:
                locationStatus = "Status not determined"
            default :
                locationStatus = "Allowed to location Access"
                shouldIAllow = true

            }

            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LabelHasBeenUpdated"), object: nil)
            if (shouldIAllow == true){
                NSLog("Location to Allowed")
                locationManager.startUpdatingLocation()
            }
            else {
                NSLog("Denied access: \(locationStatus)")
            }
}
        
    

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        }
}
