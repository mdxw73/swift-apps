//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Zack Obied on 25/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var musicRecommendations: UILabel!
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }

    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                } else {
                    self.musicRecommendations.text = "\(placemarks?[0].subThoroughfare ?? "Unknown")\n\(placemarks?[0].thoroughfare ?? "Unknown")\n\(placemarks?[0].subLocality ?? "Unknown")\n\(placemarks?[0].locality ?? "Unknown")\n\(placemarks?[0].administrativeArea ?? "Unknown")\n\(placemarks?[0].country ?? "Unknown")\n\(placemarks?[0].postalCode ?? "Unknown")"
                }
            })
            musicRecommendations.text = firstLocation.coordinate.latitude.description
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not at access user's location. Error: \(error.localizedDescription)"
    }
    
}

