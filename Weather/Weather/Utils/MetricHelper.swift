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

    /// Returns rounded down degree string with metric from double
    static func roundedDegree(_ degree: Double?) -> String {

        if let degree = degree {
            return String(Int(degree)) + "°C"
        }

        return ""
    }

    /// Returns rounded down speed string with metric as m/h
    static func roundedSpeed(_ speed: Double?) -> String {

        if let speed = speed {
            return "\(Int(speed)) m/h"
        }
        return ""
    }

    /// Returns pressure speed with hPa unit
    static func roundedPressure(_ pressure: Double?) -> String {

        if let pressure = pressure {
            return "\(Int(pressure)) hPa"
        }

        return ""
    }

    /// Returns rounded humidity as percentage
    static func roundedHumidity(_ humidity: Double?) -> String {

        if let humidity = humidity {
            return "\(Int(humidity)) %"
        }

        return ""
    }

    /// Returns compass direction with given degree
    static func compassDirection(for degree: Double?) -> String? {

        guard let degree = degree, degree >= 0 else { return nil }

        let directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
        let index = Int((degree + 22.5) / 45.0) & 7
        return directions[index]
    }
}
