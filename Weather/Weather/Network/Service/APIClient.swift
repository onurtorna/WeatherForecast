//
//  APIClient.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

final class APIClient {

    static func todayWeather(latitude: Double,
                             longtitude: Double,
                             completion: @escaping (WeatherInformation?, Error?) -> Void) {

        APIRouter.today(lat: latitude,
                        lon: longtitude).request.responseJSON { (dataResponse) in

                            ServiceManager.handleResponse(dataResponse,
                                                          of: WeatherInformation.self,
                                                          completion: completion)
        }

    }

    /// Fetches 5 day weather forecast for the location
    static func weatherForecast(latitude: Double,
                                longtitude: Double,
                                completion: @escaping (ForecastResponse?, Error?) -> Void) {

        APIRouter.forecast(lat: latitude,
                           lon: longtitude).request.responseJSON { (dataResponse) in

                ServiceManager.handleResponse(dataResponse,
                                              of: ForecastResponse.self,
                                              completion: completion)
        }
    }
}
