//
//  WeatherDetail.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct WeatherDetail: Codable {

    /// Main weather condition
    var main: String?

    /// Description of the weather
    var description: String?

    /// Icon id related to weather
    var icon: String?
}
