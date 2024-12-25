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
}
