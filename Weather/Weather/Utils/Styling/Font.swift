//
//  Font.swift
//  Weather
//
//  Created by Onur Torna on 6.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

enum Font: String {

    case regular = "ProximaNova-Regular"
    case bold = "ProximaNova-Bold"
    case semiBold = "ProximaNova-SemiBold"
    case light = "ProximaNova-Light"

    func with(size: CGFloat) -> UIFont {
        return UIFont(name: rawValue, size: size)!
    }
}
