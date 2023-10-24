//
//  LocationUpdate.swift
//
//
//  Created by Michele Dussin on 20/12/21.
//

import UIKit
import CoreLocation


class LocationUpdate: UIViewController, CLLocationManagerDelegate{
    
    
    var locationManager = CLLocationManager()
    var latitudine = 0.0
    var longitudine = 0.0
    var altitude = 0
    
    //everytime user location changes
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            latitudine = location.coordinate.latitude
            longitudine = location.coordinate.longitude
            altitude = Int(location.altitude)
            //Do something
            print(location)
        }
    }

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
            //setup
            locationManager = CLLocationManager()
            locationManager.requestAlwaysAuthorization()
            locationManager.allowsBackgroundLocationUpdates = true
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
            }
            
      
        }
      
}



