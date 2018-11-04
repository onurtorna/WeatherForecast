//
//  WeatherInformation.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct WeatherInformation: Codable, Response {

    /// Date string in yyyy-MM-dd HH:mm:ss format
    var date: String?

    var main: MainWeather?

    var weather: [WeatherDetail]?

    var clouds: Clouds?

    var wind: Wind?

    var rain: Rain?

    /// Name of the location
    var name: String?

    enum CodingKeys: String, CodingKey {

        case date = "dt_txt"
        case main
        case weather
        case clouds
        case wind
        case rain
        case name
    }
}
