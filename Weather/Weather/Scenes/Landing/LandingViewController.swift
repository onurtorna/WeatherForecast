//
//  LandingViewController.swift
//  Weather
//
//  Created by Onur Torna on 31.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
            let cancelAction = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: nil)
            let settingsAction = UIAlertAction(title: "Go to settings", style: .default) { (_) in

                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsUrl)
                }
            }

            permissionAlert.addAction(settingsAction)
            permissionAlert.addAction(cancelAction)

            present(permissionAlert, animated: true, completion: nil)
        }
    }

    func openApplicationIfCan() {

        if LocationManager.shared.isPermissionGranted {

            let forecastStoryboard = UIStoryboard(name: Global.Storyboard.forecast, bundle: nil)
            if let viewController = forecastStoryboard.instantiateInitialViewController() {
                show(viewController, sender: nil)
            }
        }
    }
}
