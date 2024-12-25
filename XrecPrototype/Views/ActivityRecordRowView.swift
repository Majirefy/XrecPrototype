//
//  ActivityRecordRowView.swift
//  XrecPrototype
//
//  Created by Majirefy on 2024/12/25.
//

import SwiftUI

struct ActivityRecordRowView: View {
    @Bindable var activity: Activity
    
    @ScaledMetric private var lableWidth = 20
    @ScaledMetric private var labelHeight = 100
    @ScaledMetric private var durationFontSize = 60
    
    var body: some View {
        HStack {
            Rectangle()
                .foregroundStyle(activity.activityType.color)
                .frame(width: lableWidth, height: labelHeight)
            VStack(alignment: .leading) {
                Text("Sex")
                    .font(.largeTitle)
                    .bold()
                Label("\(activity.startTime.shortFormattedTime) - \(activity.endTime.shortFormattedTime)", systemImage: "clock")
                    .foregroundStyle(.secondary)
                RatingView(rating: $activity.rating)
                    .padding(.top, 2)
                    .disabled(true)
            }
            Spacer()
            VStack(alignment: .center, spacing: 0) {
                Text("\(activity.duration)")
                    .font(.system(size: durationFontSize, design: .monospaced))
                    .bold()
                Text("min")
                    .font(.headline)
            }
            .padding(.horizontal)
        }
        .clipShape(RoundedRectangle(cornerRadius: lableWidth / 2, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: lableWidth / 2, style: .continuous)
                .stroke(activity.activityType.color, lineWidth: 2)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ActivityRecordRowView(activity: Activity())
}
