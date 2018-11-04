//
//  NibLoadable.swift
//  Weather
//
//  Created by Onur Torna on 4.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

protocol NibLoadable {
    static var defaultNibName: String { get }
    static func loadFromNib() -> Self
}

// MARK: - UIView
extension NibLoadable where Self: UIView {

    static var defaultNibName: String {
        return String(describing: self)
    }

    static var defaultNib: UINib {
        return UINib(nibName: defaultNibName, bundle: nil)
    }

    static func loadFromNib() -> Self {
        guard let nib = Bundle.main.loadNibNamed(defaultNibName,
                                                 owner: nil,
                                                 options: nil)?.first as? Self
            else {
                fatalError("[NibLoadable] Cannot load view from nib.")
        }

        return nib
    }
}

// MARK: - UIViewController
extension NibLoadable where Self: UIViewController {

    static var defaultNibName: String {
        return String(describing: self)
    }

    static var defaultNib: UINib {
        return UINib(nibName: defaultNibName, bundle: nil)
    }

    static func loadFromNib() -> Self {

        return self.init(nibName: defaultNibName, bundle: nil)
    }
}
