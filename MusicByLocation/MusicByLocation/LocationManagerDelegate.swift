//
//  LocationManagerDelegate.swift
//  MusicByLocation
//
//  Created by Zack Obied on 03/03/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {
    let geocoder = CLGeocoder()
    weak var vc: ViewController?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.vc?.updateDisplay(text: "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)")
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.vc?.updateArtistsByLocation(text: firstPlacemark.locality)
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        vc?.updateDisplay(text: "Could not at access user's location. Error: \(error.localizedDescription)")
    }
}
