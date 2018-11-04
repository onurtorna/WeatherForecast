//
//  APIRouter.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

enum APIRouter {

    case today(lat: Double, lon: Double)
    case forecast(lat: Double, lon: Double)

    // MARK: - Request
    var request: Alamofire.DataRequest {

        var encodingMethod: ParameterEncoding = URLEncoding.default
        if method == .post {
            encodingMethod = JSONEncoding.default
        }

        return NetworkManager.sessionManager.request(url!,
                                                     method: method,
                                                     parameters: parameters,
                                                     encoding: encodingMethod,
                                                     headers: headers)
    }

    // MARK: - HTTPMethod
    var method: HTTPMethod {

        switch self {
        case .forecast,
             .today:
            return .get
        }
    }

    // MARK: - URL
    private var url: URL? {
        let baseUrl = URL(string: Network.StaticUrl.base)
        let url = baseUrl?.appendingPathComponent(path)
        return url
    }

    // MARK: - PATH
    private var path: String {

        switch self {
        case .forecast:
            return "forecast"

        case .today:
            return "weather"
        }
    }

    /// Mark: Headers
    private var headers: [String: String] {
        // Headers can be added here
        return [:]
    }

    private var parameters: Parameters? {

        switch self {
        case let .forecast(lat: lat, lon: lon):
            return ForecastRequest.generateParameters(lat: lat,
                                                      lon: lon)
        case .today(let lat, let lon):
            return ForecastRequest.generateParameters(lat: lat,
                                                      lon: lon)
        }
    }
}

