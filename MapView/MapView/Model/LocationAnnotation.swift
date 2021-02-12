//
//  LocationAnnotation.swift
//  MapView
//
//  Created by Jose Alarcon Chacon on 2/12/21.
//

import Foundation
import MapKit

class LocationAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    let title: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
