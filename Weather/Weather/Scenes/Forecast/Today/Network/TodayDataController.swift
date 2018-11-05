//
//  TodayDataController.swift
//  Weather
//
//  Created by Onur Torna on 4.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class TodayDataController: TodayDataProtocol {

    func fetchTodaysWeather(latitude: Double,
                            longtitude: Double,
                            completion: @escaping (WeatherInformation?, Error?) -> Void) {

        APIClient.todayWeather(latitude: latitude,
                               longtitude: longtitude) { (info, error) in

                                completion(info, error)
        }
    }
}
