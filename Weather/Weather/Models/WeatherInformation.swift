//
//  WeatherInformation.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct WeatherInformation: Codable, Response {

    var main: MainWeather?

    var weather: [WeatherDetail]?

    var clouds: Clouds?

    var precipitation: Precipitation?

    var wind: Wind?

    var rain: Rain?

    /// Name of the location
    var name: String?

    /// Date string in yyyy-MM-dd HH:mm:ss format
    var date: String?

    /// Day of the week of the weather info
    var weekDay: String {
        return DateHelper.dayOfTheWeek(date)
    }

    enum CodingKeys: String, CodingKey {

        case date = "dt_txt"
        case main
        case weather
        case clouds
        case wind
        case rain
        case name
        case precipitation
    }
}
