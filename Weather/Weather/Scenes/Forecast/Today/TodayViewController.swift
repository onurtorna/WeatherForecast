//
//  TodayViewController.swift
//  Weather
//
//  Created by Onur Torna on 4.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class TodayViewController: UIViewController {

    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var mainWeatherImageView: UIImageView!
    @IBOutlet private weak var degreeExplanationLabel: UILabel!
    @IBOutlet private weak var rainLabel: UILabel!
    @IBOutlet private weak var precipitationLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var windLabel: UILabel!
    @IBOutlet private weak var windDirectionLabel: UILabel!
    @IBOutlet private weak var shareButton: UIButton!

    var viewModel = TodayViewModel()
}

// MARK: - StoryboardLoadable
extension TodayViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.forecast
    }
}
