//
//  MetricHelper.swift
//  Weather
//
//  Created by Onur Torna on 5.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class MetricHelper {

    enum Unit: String {
        case degree = "°C"
        case shortDegree = "°"
        case speed = "m/h"
        case pressure = "hPa"
        case humidity = "%"
        case precipitation = "mm"
    }

    static func roundedUnit(`for` value: Double?, unit: Unit) -> String {

        if let value = value {
            return String(Int(value)) + " " + unit.rawValue
        }

        return "-"
    }

    /// Returns compass direction with given degree
    static func compassDirection(for degree: Double?) -> String? {

        guard let degree = degree, degree >= 0 else { return nil }

        let directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
        let index = Int((degree + 22.5) / 45.0) & 7
        return directions[index]
    }
}
