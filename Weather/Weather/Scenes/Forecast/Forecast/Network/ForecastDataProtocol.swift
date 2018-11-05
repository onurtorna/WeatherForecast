//
//  ForecastDataProtocol.swift
//  Weather
//
//  Created by Onur Torna on 5.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol ForecastDataProtocol {

    /// Fetches weather forecast for 5 days for given latitude and longtitude
    func fetchForecast(latitude: Double,
                       longtitude: Double,
                       completion: @escaping ([WeatherInformation]?, City?, Error?) -> Void)
}
