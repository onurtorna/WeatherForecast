//
//  ForecastViewModel.swift
//  Weather
//
//  Created by Onur Torna on 5.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class ForecastState {

    enum Change {
        case loading(Bool)
        case error(message: String?)
        case dataFetch
        case cityFetch(cityName: String?)
    }

    var onChange: ((ForecastState.Change) -> Void)?

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

    var city: City? {
        didSet {
            onChange?(.cityFetch(cityName: city?.name))
        }
    }

    var forecastList: [WeatherInformation]?

    /// Forecast list grouped by week of the day
    var forecastDayList: [(weekDay: String, list: [WeatherInformation])]? {
        didSet {
            onChange?(.dataFetch)
        }
    }
}

final class ForecastViewModel {

    private var state = ForecastState()
    private let dataController = ForecastDataController()

    var stateChangeHandler: ((ForecastState.Change) -> Void)? {
        get {
            return state.onChange
        }

        set {
            state.onChange = newValue
        }
    }

    var forecastItemsSectionCount: Int {
        return state.forecastDayList?.count ?? 0
    }

    func forecastItemCount(in section: Int) -> Int {
        return state.forecastDayList?[section].list.count ?? 0
    }

    func forecastSectionName(_ section: Int) -> String? {
        return state.forecastDayList?[section].weekDay
    }

    func forecastItem(at index: Int, section: Int) -> WeatherInformation? {
        return state.forecastDayList?[section].list[index]
    }
}

// MARK: - Helpers
private extension ForecastViewModel {

    /// Groups forecast item list by week day and updates related state list
    func groupForecastByWeekDay() {

        guard let forecastList = state.forecastList else { return }

        var forecastDictionary: [String: [WeatherInformation]] = [:]
        for ins in forecastList {

            var weekDayList = forecastDictionary[ins.weekDay]
            if weekDayList == nil {
                forecastDictionary[ins.weekDay] = [ins]
            } else {
                weekDayList?.append(ins)
                forecastDictionary[ins.weekDay] = weekDayList
            }
        }

        var temporaryDayList: [(weekDay: String, list: [WeatherInformation])] = []
        for item in forecastDictionary {
            let key = item.key
            let value = item.value
            temporaryDayList.append((weekDay: key, list: value))
        }

        state.forecastDayList = temporaryDayList
    }
}

// MARK: - Network
extension ForecastViewModel {

    func fetchForecast() {

        let currentCoordinate = LocationManager.shared.currentLocation?.coordinate

        guard let latitude = currentCoordinate?.latitude,
            let longtitude = currentCoordinate?.longitude else {

                state.errorMessage = "Location cannot be fetched."
                return
        }

        state.isLoading = true
        dataController.fetchForecast(
            latitude: latitude,
            longtitude: longtitude) { [weak self] (forecastList, city, error) in

                guard let strongSelf = self else { return }

                strongSelf.state.isLoading = false

                guard error == nil else { return }

                strongSelf.state.city = city
                strongSelf.state.forecastList = forecastList
                strongSelf.groupForecastByWeekDay()
        }

    }
}
