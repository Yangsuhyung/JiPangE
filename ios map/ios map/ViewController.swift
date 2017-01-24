//
//  ViewController.swift
//  ios map
//
//  Created by cscoi054 on 2017. 1. 24..
//  Copyright © 2017년 a. All rights reserved.
//

import UIKit
import MapKit




class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
    
        let seoul = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.541, 126.986), MKCoordinateSpanMake(0.1766154, 0.153035))
        
        mapView.setRegion(seoul, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

