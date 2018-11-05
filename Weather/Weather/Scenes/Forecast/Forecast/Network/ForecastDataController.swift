//
//  ForecastDataController.swift
//  Weather
//
//  Created by Onur Torna on 5.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class ForecastDataController: ForecastDataProtocol {

    func fetchForecast(latitude: Double,
                       longtitude: Double,
                       completion: @escaping ([WeatherInformation]?, City?, Error?) -> Void) {

        APIClient.weatherForecast(latitude: latitude,
                                  longtitude: longtitude) { (response, error) in
                                    completion(response?.list, response?.city, error)
        }
    }
}
