//
//  ForecastRequest.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

final class ForecastRequest {

    private enum Mapping {
        static let latitudeKey = "lat"
        static let lonKey = "lon"
        static let appIDKey = "appid"
        static let unitsKey = "units"
        static let unitsValue = "metric"
    }

    static func generateParameters(lat: Int, lon: Int) -> Parameters {

        return [Mapping.appIDKey: Global.APIKey.openWeatherMap,
                Mapping.latitudeKey: lat,
                Mapping.lonKey: lon,
                Mapping.unitsKey: Mapping.unitsValue]
    }

}
