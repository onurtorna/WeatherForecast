//
//  WeatherIcon.swift
//  Weather
//
//  Created by Onur Torna on 6.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

enum WeatherIcon: String, Codable {

    case clearSkyDay = "01d"
    case clearSkyNight = "01n"
    case fewCloudsDay = "02d"
    case fewCloudsNight = "02n"
    case scatteredCloudsDay = "03d"
    case scatteredCloudsNight = "03n"
    case brokenCloudsDay = "04d"
    case brokenCloudsNight = "04n"
    case showerRainDay = "09d"
    case showerRainNight = "09n"
    case rainDay = "10d"
    case rainNight = "10n"
    case thunderStormDay = "11d"
    case thunderStormNight = "11n"
    case snowDay = "13d"
    case snowNight = "13n"
    case mistDay = "50d"
    case mistNight = "50n"

    enum Size {
        case medium
        case large
    }

    /// Returns related image with desired size
    func image(with size: Size) -> UIImage {
        switch size {
        case .medium:
            switch self {
            case .clearSkyDay:
                return #imageLiteral(resourceName: "clearSkyNightMedium.pdf")

            case .clearSkyNight:
                return #imageLiteral(resourceName: "clearSkyDayMedium.pdf")

            case .fewCloudsDay:
                return #imageLiteral(resourceName: "fewCloudsDayMedium.pdf")

            case .fewCloudsNight:
                return #imageLiteral(resourceName: "fewCloudsNightMedium.pdf")

            case .scatteredCloudsDay:
                return #imageLiteral(resourceName: "scatteredCloudsDayMedium.pdf")

            case .scatteredCloudsNight:
                return #imageLiteral(resourceName: "scatteredCloudsNightMedium.pdf")

            case .brokenCloudsDay:
                return #imageLiteral(resourceName: "brokenCloudsDayMedium.pdf")

            case .brokenCloudsNight:
                return #imageLiteral(resourceName: "brokenCloudsNightMedium.pdf")

            case .showerRainDay:
                return #imageLiteral(resourceName: "showerRainDayMedium.pdf")

            case .showerRainNight:
                return #imageLiteral(resourceName: "showerRainNightMedium.pdf")

            case .rainDay:
                return #imageLiteral(resourceName: "rainDayMedium.pdf")

            case .rainNight:
                return #imageLiteral(resourceName: "rainNightMedium.pdf")

            case .thunderStormDay:
                return #imageLiteral(resourceName: "thunderstormDayMedium.pdf")

            case .thunderStormNight:
                return #imageLiteral(resourceName: "thunderstormNightMedium.pdf")

            case .snowDay:
                return #imageLiteral(resourceName: "snowDayMedium.pdf")

            case .snowNight:
                return #imageLiteral(resourceName: "snowNightMedium.pdf")

            case .mistDay:
                return #imageLiteral(resourceName: "mistDayMedium.pdf")

            case .mistNight:
                return #imageLiteral(resourceName: "mistNightMedium.pdf")
            }

        case .large:
            switch self {
            case .clearSkyDay:
                return #imageLiteral(resourceName: "clearSkyDayLarge.pdf")

            case .clearSkyNight:
                return #imageLiteral(resourceName: "clearSkyNightLarge.pdf")

            case .fewCloudsDay:
                return #imageLiteral(resourceName: "fewCloudsDayLarge.pdf")

            case .fewCloudsNight:
                return #imageLiteral(resourceName: "fewCloudsNightLarge.pdf")

            case .scatteredCloudsDay:
                return #imageLiteral(resourceName: "scatteredCloudsDayLarge.pdf")

            case .scatteredCloudsNight:
                return #imageLiteral(resourceName: "scatteredCloudsNightLarge.pdf")

            case .brokenCloudsDay:
                return #imageLiteral(resourceName: "brokenCloudsDayLarge.pdf")

            case .brokenCloudsNight:
                return #imageLiteral(resourceName: "brokenCloudsNightLarge.pdf")

            case .showerRainDay:
                return #imageLiteral(resourceName: "showerRainDayLarge.pdf")

            case .showerRainNight:
                return #imageLiteral(resourceName: "showerRainNightLarge.pdf")

            case .rainDay:
                return #imageLiteral(resourceName: "rainDayLarge.pdf")

            case .rainNight:
                return #imageLiteral(resourceName: "rainNightLarge.pdf")

            case .thunderStormDay:
                return #imageLiteral(resourceName: "thunderstormDayLarge.pdf")

            case .thunderStormNight:
                return #imageLiteral(resourceName: "thunderstormNightLarge.pdf")

            case .snowDay:
                return #imageLiteral(resourceName: "snowDayLarge.pdf")

            case .snowNight:
                return #imageLiteral(resourceName: "snowNightLarge.pdf")

            case .mistDay:
                return #imageLiteral(resourceName: "mistDayLarge.pdf")

            case .mistNight:
                return #imageLiteral(resourceName: "mistNightLarge.pdf")
            }
        }
    }
}
