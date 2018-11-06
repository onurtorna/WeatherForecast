//
//  ForecastTableViewCell.swift
//  Weather
//
//  Created by Onur Torna on 5.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class ForecastTableViewCell: UITableViewCell, NibLoadable {
    
    @IBOutlet private weak var degreeLabel: UILabel!
    @IBOutlet private weak var weatherDescriptionLabel: UILabel!
    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var weatherImageView: UIImageView!
    @IBOutlet private weak var dividerImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none

        applyStyling()
    }

    func customize(with weatherInfo: WeatherInformation?) {

        guard let weatherInfo = weatherInfo else { return }

        degreeLabel.text = MetricHelper.roundedUnit(for: weatherInfo.main?.temperature,
                                                    unit: .shortDegree)
        weatherDescriptionLabel.text = weatherInfo.weather?.first?.main
        hourLabel.text = DateHelper.shortHourFromDate(weatherInfo.date)
        dividerImageView.isHidden = false

        if let icon = weatherInfo.weather?.first?.icon {
            weatherImageView.image = icon.image(with: .medium)
        }
    }

    func hideDivider() {
        dividerImageView.isHidden = true
    }
}

// MARK: - Helpers
private extension ForecastTableViewCell {

    func applyStyling() {

        LabelCustomizer.applyFont(label: degreeLabel,
                                  font: .light,
                                  size: 50,
                                  color: .dodgerBlue)

        LabelCustomizer.applyFont(label: weatherDescriptionLabel,
                                  font: .regular,
                                  size: 15)

        LabelCustomizer.applyFont(label: hourLabel,
                                  font: .semiBold,
                                  size: 18)
    }
}
