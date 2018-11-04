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

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchCurrentWeather()
    }
}

private extension TodayViewController {

    func applyState(_ change: TodayState.Change) {

        switch change {
        case .loading(let isLoading):
        // TODO: Show Loading view
            break
        case .error(message: let message):
        // TODO: Show error
            break

        case .dataFetch(let information):
            customizeViews(weatherInfo: information)
        }
    }

    func customizeViews(weatherInfo: WeatherInformation?) {

        guard let weatherInfo = weatherInfo else { return }
        print(weatherInfo)
        locationLabel.text = weatherInfo.name
        let weatherText = weatherInfo.weather?.first?.main ?? ""
        let degreeText = weatherInfo.main?.temperatureString ?? "" + "°C"
        degreeExplanationLabel.text = degreeText + " | " + weatherText
        rainLabel.text = "\(weatherInfo.main?.humidity ?? 0)%"
        pressureLabel.text = "\(Int(weatherInfo.main?.pressure ?? 0)) hPa"
        windLabel.text = "\(Int(weatherInfo.wind?.speed ?? 0)) m/h"

        let precipitationText: String
        if let precipitation = weatherInfo.precipitation?.value {
            precipitationText = "\(Int(precipitation)) + mm"
        } else {
            precipitationText = "-"
        }
        precipitationLabel.text = precipitationText
    }
}

// MARK: - StoryboardLoadable
extension TodayViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.forecast
    }
}
