//
//  WeeklyCalendarView.swift
//  XrecPrototype
//
//  Created by Majirefy on 2025/1/1.
//

import SwiftUI

struct WeeklyCalendarView: View {
    @ScaledMetric private var selectedCircleSize = 40
    @ScaledMetric private var badgeCircleSize = 20
    @ScaledMetric private var badgeOffset = 15
    
    @State private var currentDate = Date.now
    
    private let dateFormatter: DateFormatter = DateFormatter()
    
    // 当前日期所在周的日期数组
    private var weekDates: [Date] {
        guard let startOfWeek = currentDate.startOfWeek else { return [] }
        return (0..<7).compactMap { Calendar.current.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Date.weekDates(for: currentDate), id: \.self) { date in
                    WeeklyCalendarDayView(date: date, badgeNumber: 3)
                }
            }
            .gesture(
                DragGesture(minimumDistance: 50, coordinateSpace: .local)
                    .onEnded({ value in
                        if value.translation.width < 0 {
                            withAnimation {
                                changeWeek(by: 1)
                            }
                        } else if value.translation.width > 0 {
                            withAnimation {
                                changeWeek(by: -1)
                            }
                        }
                    })
            )
        }
        .padding()
    }
    
    // 改变周数
    private func changeWeek(by offset: Int) {
        guard let newDate = Calendar.current.date(byAdding: .weekOfYear, value: offset, to: currentDate) else { return }
        currentDate = newDate
    }
}

struct HorizontalCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyCalendarView()
            .environment(\.locale, .init(identifier: "zh_CN"))
    }
}
