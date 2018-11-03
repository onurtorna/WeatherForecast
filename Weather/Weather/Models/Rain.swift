//
//  Rain.swift
//  Weather
//
//  Created by Onur Torna on 3.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct Rain: Codable {

    /// Rain volume for the last three hours
    var volume: Double?

    enum CodingKeys: String, CodingKey {
        case volume = "3h"
    }
}
