//
//  ForecastTabBarController.swift
//  Weather
//
//  Created by Onur Torna on 4.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class ForecastTabBarController: UITabBarController {
    // TODO:
}

// MARK: - StoryboardLoadable
extension ForecastTabBarController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.forecast
    }
}
