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
    
    // Delegate Methods
    // invoke any time the permission of the location manager has change
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationM.startUpdatingLocation()
        }
    }
    
    // This delegate method will be u=invoke whenever a user location has been updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first!
        print("Location Update: latitude -> \(location.coordinate.latitude), longitude ->  \(location.coordinate.longitude)")
    }
}

