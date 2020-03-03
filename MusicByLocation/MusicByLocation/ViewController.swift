//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Zack Obied on 25/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit
import CoreLocation

/*
 - Outlet
 - Action
 - Updating the display (using the outlet)
 - Requesting Location
 - Tweaking response to get artist names
 */

class ViewController: UIViewController {

    @IBOutlet var musicRecommendations: UILabel!
    
    let locationManager = CLLocationManager()
    let iTunesAdaptor = ITunesAdaptor()
    let locationManagerDelegate = LocationManagerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = locationManagerDelegate
        locationManagerDelegate.vc = self
    }

    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func updateDisplay(text: String?) {
        musicRecommendations.text = text
    }
    
    func updateArtistsByLocation(text: String?) {
        iTunesAdaptor.getArtists(search: text) { (artists) in
            let names = artists?.map { return $0.artistName }
            DispatchQueue.main.async {
                self.musicRecommendations.text = names?.joined(separator: ", ")
            }
        }
    }
    
}

