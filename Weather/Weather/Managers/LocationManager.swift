//
//  LocationManager.swift
//  Weather
//
//  Created by Onur Torna on 4.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import CoreLocation

final class LocationManager: CLLocationManager {

    static var shared: LocationManager!

    static func initializeManager() {

        shared = LocationManager()

        LocationManager.shared.delegate = LocationManager.shared
        LocationManager.shared.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        LocationManager.shared.startUpdatingLocation()
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        // TODO: Show warning and use saved coordinates if can
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        // TODO: Fetch forecast
    }
}
