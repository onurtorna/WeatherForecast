//
//  TodayViewModel.swift
//  Weather
//
//  Created by Onur Torna on 4.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class TodayState {

    enum Change {
        case loading(Bool)
        case error(message: String?)
        case dataFetch(WeatherInformation?)
    }

    var onChange: ((TodayState.Change) -> Void)?

    /// Indicates loading state
    var isLoading = false {
        didSet {
            onChange?(.loading(isLoading))
        }
    }

    /// Received error message
    var errorMessage: String? {
        didSet {
            onChange?(.error(message: errorMessage))
        }
    }

    /// Current weather information
    var weatherInformation: WeatherInformation? {
        didSet {
            onChange?(.dataFetch(weatherInformation))
        }
    }
}

final class TodayViewModel {

    private let state = TodayState()
    private let dataController = TodayDataController()

    var stateChangeHandler: ((TodayState.Change) -> Void)? {
        get {
            return state.onChange
        }

        set {
            state.onChange = newValue
        }
    }
}

extension TodayViewModel {

    func fetchCurrentWeather() {

        let currentCoordinate = LocationManager.shared.currentLocation?.coordinate

        guard let latitude = currentCoordinate?.latitude,
            let longtitude = currentCoordinate?.longitude else {

                state.errorMessage = "Location cannot be fetched."
                return
        }

        state.isLoading = true
        dataController.fetchTodaysWeather(
            latitude: latitude,
            longtitude: longtitude) { [weak self] (info, error) in

                self?.state.isLoading = false

                guard let strongSelf = self else { return }

                strongSelf.state.weatherInformation = info
        }
    }
}
