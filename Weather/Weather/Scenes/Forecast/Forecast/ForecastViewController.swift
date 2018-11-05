//
//  ForecastViewController.swift
//  Weather
//
//  Created by Onur Torna on 5.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class ForecastViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // TODO: Change title
        tabBarController?.title = "Prague"
    }
}


