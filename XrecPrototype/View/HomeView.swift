//
//  HomeView.swift
//  XrecPrototype
//
//  Created by Majirefy on 2024/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            WeeklyCalendarView()
                .navigationTitle("Xrec")
        }
    }
}

#Preview {
    HomeView()
}
