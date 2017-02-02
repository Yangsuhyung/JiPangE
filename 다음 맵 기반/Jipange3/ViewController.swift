//
//  ViewController.swift
//  Jipange3
//
//  Created by cscoi054 on 2017. 2. 2..
//  Copyright © 2017년 a. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MTMapViewDelegate {

    lazy var mapView : MTMapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.daumMapApiKey = "f2313336d3c99828972678fb63be0121"
        mapView.delegate = self
        mapView.baseMapType = .standard
        self.view.addSubview(mapView)
    }
    
    func poiItem(name: String, latitude: Double, longitude: Double) -> MTMapPOIItem {
        let item = MTMapPOIItem()
        item.itemName = name
        item.markerType = .redPin
        item.markerSelectedType = .redPin
        item.mapPoint = MTMapPoint(geoCoord: .init(latitude: latitude, longitude: longitude))
        item.showAnimationType = .noAnimation
        item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)    // 마커 위치 조정
        
        return item
        }

    
    
    override func viewDidAppear(_ animated: Bool) {
        var items = [MTMapPOIItem]()
        items.append(poiItem(name: "하나", latitude: 37.4981688, longitude: 127.0484572))
        items.append(poiItem(name: "둘", latitude: 37.4987963, longitude: 127.0415946))
        items.append(poiItem(name: "셋", latitude: 37.5025612, longitude: 127.0415946))
        items.append(poiItem(name: "넷", latitude: 37.5037539, longitude: 127.0426469))
        //위 부분은 viewDidLoad()에서 수행해도 괜찮습니다
        
        mapView.addPOIItems(items)
        mapView.fitAreaToShowAllPOIItems()  // 모든 마커가 보이게 카메라 위치/줌 조정
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
