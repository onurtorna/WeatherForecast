//
//  LocationManager.swift
//  Weather
//
//  Created by Onur Torna on 4.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import CoreLocation

final class LocationManager: CLLocationManager {

    private enum Constant {
        static let lastLocationLatKey = "LastLocationLat"
        static let lastLocationLonKey = "LastLocationLon"
    }

    static var shared: LocationManager!

    var authorizationStatus = CLLocationManager.authorizationStatus()

    /// Current location updated with gps
    var currentLocation: CLLocation?

    /// Last known location saved in device
    var lastKnownLocation: CLLocation? {

        let latitude = UserDefaults.standard.double(forKey: Constant.lastLocationLatKey)
        let longitude = UserDefaults.standard.double(forKey: Constant.lastLocationLonKey)

        if latitude != 0, longitude != 0 {
            return CLLocation(latitude: latitude, longitude: longitude)
        }

        return nil
    }

    var isPermissionGranted: Bool {
        return authorizationStatus == .authorizedWhenInUse
            || authorizationStatus == .authorizedAlways
    }

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

        authorizationStatus = status
        NotificationCenter.default.post(name: Global.Notification.locationPermissionChanged,
                                        object: nil)

        if status == CLAuthorizationStatus.authorizedWhenInUse ||
            status == CLAuthorizationStatus.authorizedAlways {
            startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {

        currentLocation = locations.first
        NotificationCenter.default.post(name: Global.Notification.locationChanged,
                                        object: nil)

        if let lastLocation = locations.first {
            UserDefaults.standard.set(lastLocation.coordinate.latitude,
                                      forKey: Constant.lastLocationLatKey)
            UserDefaults.standard.set(lastLocation.coordinate.longitude,
                                      forKey: Constant.lastLocationLonKey)
        }
    }
}
