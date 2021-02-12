//
//  ViewController.swift
//  LocationManager
//
//  Created by Jose Alarcon Chacon on 2/12/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationM: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager()
    }
    
    func locationManager() {
        locationM = CLLocationManager()
        locationM.delegate = self
        locationM.desiredAccuracy = kCLLocationAccuracyBest
        locationM.distanceFilter = 0.0
        
        // Request permition for user's location
        locationM.requestWhenInUseAuthorization()
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationM.startUpdatingLocation()
        }
    }
}

