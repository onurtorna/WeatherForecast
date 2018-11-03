//
//  ForecastResponse.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class ForecastResponse: Response {

    /// City of the forecast
    var city: City?

    /// Weather information list of the forecast
    var list: [WeatherInformation]?
}
