//
//  MainWeather.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct MainWeather: Codable {

    /// Temperature in Celsius
    var temperature: Double?

    /// Atmospheric pressure in hPa unit
    var pressure: Double?

    /// Humidity percentage
    var humidity: Double?

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
    }
}
