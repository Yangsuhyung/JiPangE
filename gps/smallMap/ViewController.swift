//
//  ViewController.swift
//  smallMap
//
//  Created by cscoi054 on 2017. 2. 1..
//  Copyright © 2017년 a. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    var manager:CLLocationManager!
    var userLocationShown: Bool = false
    
    @IBAction func findGeocodeAddress(_ sender: Any) {
        
        var address = txtAddress.text
        if address != "" {
            userLocationShown = false
            txtAddress.resignFirstResponder()
            getGeocodeLocation(address: address!)
            
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userLocationShown = true
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = kCLDistanceFilterNone
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        //setup our MapView
        
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(mapView:MKMapView!, regionWillChangeAnimated animated : Bool){
    }
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]){
        if !userLocationShown{
            return
        }
        let newLocation = locations.last! as! CLLocation
        
        let spanX = 0.01
        let spanY = 0.01
        var span = MKCoordinateSpanMake(spanX,spanY)
        var newRegion = MKCoordinateRegion(center : newLocation.coordinate, span:span)
        mapView.setRegion(newRegion, animated:true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = newLocation.coordinate
        annotation.title = "Current Position"
        mapView.addAnnotation(annotation)
        
    }
    
    func getGeocodeLocation(address:String)
    {
        var geocoder:CLGeocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address, completionHandler:{(placemarks, error)->Void in
            if((error) != nil){
                return
            }
            else if (placemarks?.count)! > 0{
                var placemark:CLPlacemark = placemarks![0] as! CLPlacemark
                var coordinates:CLLocationCoordinate2D = (placemark.location?.coordinate)!
                
                self.movePositionInMapView(mylatitude: coordinates.latitude, mylongitude:coordinates.longitude)
            }
        })
    }
    func movePositionInMapView(mylatitude:CLLocationDegrees, mylongitude:CLLocationDegrees){
        
        let newLocation = CLLocation(latitude:mylatitude, longitude:mylongitude)
        
        let spanX = 0.02
        let spanY = 0.02
        
        var newRegion = MKCoordinateRegion(center:newLocation.coordinate, span:MKCoordinateSpanMake(spanX,spanY))
        
        mapView.setRegion(newRegion,animated:true)
        
        mapView.regionThatFits(newRegion)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newLocation.coordinate
        
        annotation.title = txtAddress.text
        
        mapView.addAnnotation(annotation)
        
    }
    
    
}
