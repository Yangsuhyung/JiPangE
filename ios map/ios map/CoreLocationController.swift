//
//  CoreLocationController.swift
//  ios map
//
//  Created by cscoi054 on 2017. 1. 24..
//  Copyright © 2017년 a. All rights reserved.
//

import Foundation
import CoreLocation

class CoreLocationController : NSObject, CLLocationManagerDelegate{
    
    var locationManager : CLLocationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
    }
}
