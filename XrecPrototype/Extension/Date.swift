//
//  Date.swift
//  XrecPrototype
//
//  Created by Majirefy on 2024/12/25.
//

import Foundation

extension Date {
    var shortFormattedTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    var startOfWeek: Date? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        return calendar.date(from: components)
    }
    
    static func weekDates(for date: Date) -> [Date] {
        guard let startOfWeek = date.startOfWeek else { return [] }
        return (0..<7).compactMap { Calendar.current.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
}
