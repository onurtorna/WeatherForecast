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
    @IBOutlet private weak var degreeExplanationLabel: UILabel!
    @IBOutlet private weak var rainLabel: UILabel!
    @IBOutlet private weak var precipitationLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var windLabel: UILabel!
    @IBOutlet private weak var windDirectionLabel: UILabel!
    @IBOutlet private weak var mainWeatherImageView: UIImageView!
    @IBOutlet private weak var shareButton: UIButton!

    var viewModel = TodayViewModel()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = "Today"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchCurrentWeather()
    }
}

// MARK: - Helpers
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

        locationLabel.text = weatherInfo.name
        let weatherText = weatherInfo.weather?.first?.main ?? ""
        let degreeText = MetricHelper.roundedUnit(for: weatherInfo.main?.temperature,
                                                  unit: .degree)
        degreeExplanationLabel.text = degreeText + " | " + weatherText
        rainLabel.text = MetricHelper.roundedUnit(for: weatherInfo.main?.humidity,
                                                  unit: .humidity)
        pressureLabel.text = MetricHelper.roundedUnit(for: weatherInfo.main?.pressure,
                                                      unit: .pressure)
        windLabel.text = MetricHelper.roundedUnit(for: weatherInfo.wind?.speed,
                                                  unit: .speed)
        windDirectionLabel.text = MetricHelper.compassDirection(for: weatherInfo.wind?.degree)
        precipitationLabel.text = MetricHelper.roundedUnit(for: weatherInfo.precipitation?.value,
                                                           unit: .precipitation)
    }

    func applyStyling() {

        LabelCustomizer.applyFont(label: locationLabel, font: .semiBold, size: 18)
        LabelCustomizer.applyFont(label: rainLabel, font: .semiBold, size: 15)
        LabelCustomizer.applyFont(label: precipitationLabel, font: .semiBold, size: 15)
        LabelCustomizer.applyFont(label: pressureLabel, font: .semiBold, size: 15)
        LabelCustomizer.applyFont(label: windLabel, font: .semiBold, size: 15)
        LabelCustomizer.applyFont(label: windDirectionLabel, font: .semiBold, size: 15)
        LabelCustomizer.applyFont(label: degreeExplanationLabel,
                                  font: .semiBold,
                                  size: 24,
                                  color: .dodgerBlue)
        LabelCustomizer.applyFont(label: shareButton.titleLabel,
                                  font: .semiBold,
                                  size: 18,
                                  color: .orangeish)
        shareButton.setTitleColor(.orangeish, for: .normal)
    }

}

// MARK: - StoryboardLoadable
extension TodayViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.forecast
    }
}
