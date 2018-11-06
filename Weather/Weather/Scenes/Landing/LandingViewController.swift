//
//  LandingViewController.swift
//  Weather
//
//  Created by Onur Torna on 31.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class LandingViewController: UIViewController {

    private var appLaunched = false
    
    /// Indicates if permission alert is currently shown to customer
    private var isAlertShown = false

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(openApplicationIfCan),
                                               name: Global.Notification.locationPermissionChanged,
                                               object: nil)

        LocationManager.initializeManager()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        requestLocationPermissionIfNeeded()
        openApplicationIfCan()
    }
}

// MARK: - Helpers
private extension LandingViewController {

    func requestLocationPermissionIfNeeded() {

        if LocationManager.shared.authorizationStatus == .notDetermined {
            LocationManager.shared.requestWhenInUseAuthorization()
        } else if !LocationManager.shared.isPermissionGranted {

            let permissionAlert = UIAlertController(title: "Location Permission Required",
                                                    message: "You denied location permission for Weather App. You can give permission in device settings.",
                                                    preferredStyle: .alert)

            let cancelAction = UIAlertAction(title: "Cancel",  style: .cancel) { (_) in

                self.isAlertShown = false
                if LocationManager.shared.lastKnownLocation != nil {
                    self.openApplicationIfCan()
                }
            }

            let settingsAction = UIAlertAction(title: "Go to settings", style: .default) { (_) in

                self.isAlertShown = false
                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsUrl)
                }
            }

            permissionAlert.addAction(settingsAction)
            permissionAlert.addAction(cancelAction)

            isAlertShown = true
            present(permissionAlert, animated: true, completion: nil)
        }
    }

    @objc func openApplicationIfCan() {

        if !appLaunched, !isAlertShown {
            if LocationManager.shared.isPermissionGranted ||
                LocationManager.shared.lastKnownLocation != nil {

                let forecastStoryboard = UIStoryboard(name: Global.Storyboard.forecast, bundle: nil)
                if let viewController = forecastStoryboard.instantiateInitialViewController() {

                    appLaunched = true
                    show(viewController, sender: nil)
                }
            }
        }
    }
}
