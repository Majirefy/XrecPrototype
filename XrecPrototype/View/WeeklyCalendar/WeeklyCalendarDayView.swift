//
//  WeeklyCalendarDayView.swift
//  XrecPrototype
//
//  Created by Majirefy on 2025/1/3.
//

import SwiftUI

struct WeeklyCalendarDayView: View {
    var date: Date
    var badgeNumber: Int = 0
    var isSelected: Bool = false
    
    @ScaledMetric private var selectedCircleSize = 40
    @ScaledMetric private var badgeCircleSize = 20
    @ScaledMetric private var badgeOffset = 15
    
    private let dateFormatter: DateFormatter = DateFormatter()
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Text(dateFormatter.veryShortWeekdaySymbol(for: date))
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(dateFormatter.dayNumber(for: date))
                    .font(.title2)
                    .fontDesign(.rounded)
                    .fontWeight(Calendar.current.isDateInToday(date) ? .bold : .regular)
                    .foregroundStyle(dayNumberForeground(for: date))
                    .frame(width: selectedCircleSize, height: selectedCircleSize)
                    .background(dayNumberBackgroud(for: date))
                    .clipShape(Circle())
                    .overlay {
                        if badgeNumber > 0 {
                            Text("\(badgeNumber)")
                                .font(.caption2)
                                .fontDesign(.rounded)
                                .bold()
                                .frame(width: badgeCircleSize, height: badgeCircleSize)
                                .foregroundStyle(Color.primary)
                                .background(Color.orange)
                                .clipShape(Circle())
                                .offset(x: badgeOffset, y: badgeOffset)
                        }
                    }
            }
        }
    }
    
    private func dayNumberBackgroud(for date: Date) -> Color {
        if isSelected {
            if Calendar.current.isDateInToday(date) {
                return .accent
            }
            return .pink
        }
        return .clear
    }
    
    private func dayNumberForeground(for date: Date) -> Color {
        if isSelected && Calendar.current.isDateInToday(date) {
            return .white
        } else if isSelected {
            return .white
        }
        return .primary
    }
}

#Preview {
    WeeklyCalendarDayView(date: Date.now, badgeNumber: 3, isSelected: true)
}
