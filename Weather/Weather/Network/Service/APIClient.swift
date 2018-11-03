//
//  APIClient.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

final class APIClient {

    static func weatherForecast(latitude: Int,
                                longtitude: Int,
                                completion: @escaping (ForecastResponse?, Error?) -> Void) {

        APIRouter.forecast(lat: latitude,
                           lon: longtitude).request.responseJSON { (dataResponse) in

                ServiceManager.handleResponse(dataResponse,
                                              of: ForecastResponse.self,
                                              completion: completion)
        }
    }
}
