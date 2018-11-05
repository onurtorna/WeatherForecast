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

        // TODO: Apply styling
    }

    func customize(with weatherInfo: WeatherInformation?) {

        guard let weatherInfo = weatherInfo else { return }
        degreeLabel.text = MetricHelper.roundedUnit(for: weatherInfo.main?.temperature,
                                                    unit: .shortDegree)
        weatherDescriptionLabel.text = weatherInfo.weather?.first?.main
        hourLabel.text = DateHelper.shortHourFromDate(weatherInfo.date)

        // TODO: set weather image
    }

    func hideDivider() {
        dividerImageView.isHidden = true
    }
}
