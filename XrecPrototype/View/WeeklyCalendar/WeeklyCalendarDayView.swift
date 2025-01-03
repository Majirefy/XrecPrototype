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
    
    @ScaledMetric private var selectedCircleSize = 40
    @ScaledMetric private var badgeCircleSize = 20
    @ScaledMetric private var badgeOffset = 15
    
    private let dateFormatter: DateFormatter = DateFormatter()
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center) {
                Text(dateFormatter.veryShortWeekdaySymbol(for: date))
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(dateFormatter.dayNumber(for: date))
                    .font(.title2)
                    .fontDesign(.rounded)
                    .fontWeight(Date.isToday(date) ? .bold : .regular)
                    .foregroundStyle(Date.isToday(date) ? .white : .primary)
                    .frame(width: selectedCircleSize, height: selectedCircleSize)
                    .background(Date.isToday(date) ? Color.accentColor : .clear)
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
            Spacer()
        }
    }
}

#Preview {
    WeeklyCalendarDayView(date: Date.now, badgeNumber: 3)
}
