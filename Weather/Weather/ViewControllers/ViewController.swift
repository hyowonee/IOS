//
//  ViewController.swift
//  Weather
//
//  Created by Hyowon Choi on 2018. 5. 5..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet var mapView: GMSMapView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var placeLabel: UILabel!
    
    var apiKey = "af90d6e8611a0eb157ef6264f53a575e"
    // 초기 위치 설정
    var lat = 37.566535
    var lon = 126.977969
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 14.0)
        self.mapView.isMyLocationEnabled = true
        self.mapView.settings.zoomGestures = true
        self.mapView.camera = camera
        self.mapView.delegate = self
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marker.map = mapView
        
        self.getWeather(lat: lat, lon: lon)
    }
    
    // 날씨 API로 지도의 지역이름, 온도 정보를 가져온다.
    func getWeather(lat: Double, lon: Double) {
        Alamofire
            .request("https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&apiKey=\(apiKey)")
            // Weather형태로 DataResponse의 데이터를 받아와서 response 변수에 넣어줌
            .responseObject { (response: DataResponse<Weather>) in
                let weatherResponse = response.result.value
                
                self.placeLabel.text = weatherResponse?.name ?? ""
                if let temp = weatherResponse?.main?.temp {
                    // 절대온도 -> 섭씨온도로 바꿔준다.
                    self.tempLabel.text = "\(temp - 273.15)℃"
                }
            }
    }

}

// MARK: - GMSMapViewDelegate
extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        // MapView를 움직일 경우
        self.getWeather(lat: position.target.latitude, lon: position.target.longitude)
    }
}
