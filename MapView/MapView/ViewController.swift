//
//  ViewController.swift
//  MapView
//
//  Created by Jose Alarcon Chacon on 2/12/21.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 0.0
        
        // Request permission for user location
        locationManager.requestWhenInUseAuthorization()
        
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }

        // annotatipn
        let golden_state_warriors = LocationAnnotation(title: "Golden State Warriors Chase Center", coordinate: CLLocationCoordinate2D(latitude: 37.76880989976761, longitude: -122.38754333680092))
        mapView.addAnnotation(golden_state_warriors)
        // center the visible region of our mapview on that single annotation
        mapView.setCenter(golden_state_warriors.coordinate, animated: false)
    }
    
    // Delegate method
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first!
        print("location update latitude: \(location.coordinate.latitude)  longitude: \(location.coordinate.longitude)")
    }
}

