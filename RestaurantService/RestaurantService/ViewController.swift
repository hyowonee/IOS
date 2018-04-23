//
//  ViewController.swift
//  RestaurantService
//
//  Created by Hyowon Choi on 2018. 4. 22..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.652439, longitude: 126.790648, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.652439, longitude: 126.790648)
        marker.title = "맛집"
        marker.map = mapView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "Detail":
            let marker = sender as! GMSMarker
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.latitude = marker.position.latitude
            detailViewController.longitude = marker.position.longitude
            detailViewController.restaurantName = marker.title!
            return
        default:
            return
        }
    }

}

extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        self.performSegue(withIdentifier: "Detail", sender: marker)
        return true
    }
}
