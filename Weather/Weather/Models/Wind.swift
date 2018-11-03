//
//  Wind.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct Wind: Codable {

    /// Speed of the wind in m/sec
    var speed: Double

    /// Wind direction in degrees
    var degree: Double

    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
}
