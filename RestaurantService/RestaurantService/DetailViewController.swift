//
//  DetailViewController.swift
//  RestaurantService
//
//  Created by Hyowon Choi on 2018. 4. 22..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import GoogleMaps

class DetailViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mapView: GMSMapView!
    
    var latitude: Double = 0
    var longitude: Double = 0
    var restaurantName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: self.latitude, longitude: self.longitude, zoom: 16.0)
        self.mapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        marker.title = self.restaurantName
        marker.map = self.mapView
        
        self.title = self.restaurantName
    }

}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
