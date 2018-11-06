//
//  ForecastViewController.swift
//  Weather
//
//  Created by Onur Torna on 5.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class ForecastViewController: UIViewController {

    private enum Constant {
        static let headerHeight: CGFloat = 45
        static let headerLabelPadding: CGFloat = -18
    }

    @IBOutlet private weak var tableView: UITableView!

    private var cityName: String?

    var viewModel = ForecastViewModel()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = cityName
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(ForecastTableViewCell.defaultNib,
                           forCellReuseIdentifier: ForecastTableViewCell.defaultNibName)
        tableView.delegate = self
        tableView.dataSource = self

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchForecast()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateLocationInformation),
                                               name: Global.Notification.locationChanged,
                                               object: nil)
    }
}

// MARK: - Helpers
private extension ForecastViewController {

    func applyState(_ change: ForecastState.Change) {

        switch change {
        case .loading:
            // TODO
            break
        case .error:
            // TODO:
            break

        case .cityFetch(cityName: let name):
            tabBarController?.title = name
            cityName = name

        case .dataFetch:
            tableView.reloadData()
        }
    }

    @objc func updateLocationInformation() {
        viewModel.fetchForecast()
    }
}

// MARK: - UITableViewDataSource
extension ForecastViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.forecastItemCount(in: section)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.forecastItemsSectionCount
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ForecastTableViewCell.defaultNibName) as? ForecastTableViewCell
            else {
                return UITableViewCell()
        }
        let info = viewModel.forecastItem(at: indexPath.row, section: indexPath.section)
        cell.customize(with: info)
        // Last cell in section
        if viewModel.forecastItemCount(in: indexPath.section) == indexPath.row + 1 {
            cell.hideDivider()
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension ForecastViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView()
        headerView.backgroundColor = UIColor.white
        headerView.layer.borderColor = UIColor.separator.cgColor
        headerView.layer.borderWidth = 1
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
        headerView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor,
                                            constant: Constant.headerLabelPadding).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor,
                                            constant: 0).isActive = true

        titleLabel.text = viewModel.forecastSectionName(section)?.uppercased()
        LabelCustomizer.applyFont(label: titleLabel, font: .semiBold, size: 14, color: .lightBlack)
        return headerView
    }

    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.headerHeight
    }
}
