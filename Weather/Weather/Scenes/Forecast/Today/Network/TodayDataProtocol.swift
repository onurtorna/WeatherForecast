//
//  TodayDataProtocol.swift
//  Weather
//
//  Created by Onur Torna on 4.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol TodayDataProtocol {

    /// Fetches current weather at given location
    func fetchTodaysWeather(latitude: Double,
                            longtitude: Double,
                            completion: @escaping (WeatherInformation?, Error?) -> Void)
}
