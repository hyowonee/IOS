//
//  ViewController.swift
//  GoogleMapSample
//
//  Created by Hyowon Choi on 2018. 4. 7..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    // MARK: Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMap()
    }
    
    // MARK: Initializing
    
    func loadMap() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.frame = UIScreen.main.bounds
        self.view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }

}

