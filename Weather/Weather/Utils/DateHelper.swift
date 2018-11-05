//
//  DateHelper.swift
//  Weather
//
//  Created by Onur Torna on 5.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class DateHelper {

    private enum Constant {
        static let serviceDateFormat = "yyyy-MM-dd HH:mm:ss"
        static let shortHourFormat = "HH:mm"
    }

    private enum WeekDay: Int {
        case sunday = 1
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday

        var description: String {
            return String(describing: self)
        }
    }

    static let dateFormatter = DateFormatter()
    static let calendar = Calendar(identifier: .gregorian)

    static func shortHourFromDate(_ dateString: String?) -> String {

        guard let dateString = dateString else { return "" }

        dateFormatter.dateFormat = Constant.serviceDateFormat

        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = Constant.shortHourFormat
            return dateFormatter.string(from: date)
        }

        return ""
    }

    static func dayOfTheWeek(_ dateString: String?) -> String {

        guard let dateString = dateString else { return "" }
        dateFormatter.dateFormat = Constant.serviceDateFormat
        guard let todayDate = dateFormatter.date(from: dateString) else { return "" }
        let weekDay = calendar.component(.weekday, from: todayDate)
        return WeekDay(rawValue: weekDay)?.description ?? ""
    }
}
