//
//  City.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct City: Codable {

    /// Unique id of the city
    var cityId: Int?

    /// Name of the city
    var name: String?

    enum CodingKeys: String, CodingKey {
        case cityId = "id"
        case name
    }
}
