//
//  DateFormatter.swift
//  XrecPrototype
//
//  Created by Majirefy on 2025/1/3.
//

import Foundation

extension DateFormatter {
    func veryShortWeekdaySymbol(for date: Date) -> String {
        let formatter = DateFormatter()
        let locale = Locale(identifier: Locale.preferredLanguages.first ?? "en_US")
        formatter.locale = locale
        return formatter.veryShortWeekdaySymbols[Calendar.autoupdatingCurrent.component(.weekday, from: date) - 1]
    }
    
    func dayNumber(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
}
