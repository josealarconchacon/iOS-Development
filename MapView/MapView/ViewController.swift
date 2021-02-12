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
        locationM()
        annotationView()
    }
    
    func locationM() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 0.0
        
        // Request permission for user location
        locationManager.requestWhenInUseAuthorization()
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    

    func annotationView() {
        // annotatipn
        let golden_state_warriors = LocationAnnotation(title: "Golden State Warriors Chase Center", coordinate: CLLocationCoordinate2D(latitude: 37.76880989976761, longitude: -122.38754333680092))
        // annotation that will represent the destination
        let oracle_park = LocationAnnotation(title: "Oracle Park", coordinate: CLLocationCoordinate2D(latitude: 37.779290451757895, longitude: -122.38922688420824))
        mapView.addAnnotation(golden_state_warriors)
        mapView.addAnnotations([golden_state_warriors, oracle_park])
        displayRoute(sourceCoordinate: golden_state_warriors.coordinate, destinationCoordinate: oracle_park.coordinate)
        
        // center the visible region of our mapview on that single annotation
//        mapView.setCenter(golden_state_warriors.coordinate, animated: false)
    }
    
    
    // take two coordinates to render a route on our mapView
    func displayRoute(sourceCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        // Placemarks
        let source_placemarks = MKPlacemark(coordinate: sourceCoordinate)
        let source_destination = MKPlacemark(coordinate: destinationCoordinate)
        
        // get direction of the two coordinate
        let direction_request = MKDirections.Request()
        direction_request.source = MKMapItem(placemark: source_placemarks)
        direction_request.destination = MKMapItem(placemark: source_destination)
        direction_request.transportType = .automobile
        
        let direction = MKDirections(request: direction_request)
        direction.calculate(completionHandler: { (response, error) in
            if let error = error {
                print("Error calculating route: \(error.localizedDescription)")
            }
            if let response = response {
                let route = response.routes.first!
                // Drawing the route on the map
                self.mapView.addOverlay(route.polyline, level: .aboveLabels)
                // Zoom in and center map's visible region on the route
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect,
                                               edgePadding: UIEdgeInsets(top: 80.0,
                                                                         left: 80.0,
                                                                         bottom: 80.0,
                                                                         right: 80.0), animated: false)
            }
        })
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

