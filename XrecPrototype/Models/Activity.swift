//
//  Activity.swift
//  XrecPrototype
//
//  Created by Majirefy on 2024/12/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Activity {
    private(set) var id: String = UUID().uuidString
    var activityType: ActivityType = ActivityType.sex
    var updateTime: Date = Date.now
    var startTime: Date = Date.now
    var endTime: Date = Date.now
    var duration: Int {
        let dateComponents = Calendar.current.dateComponents([.minute], from: startTime, to: endTime)
        let minutes = dateComponents.minute ?? 0
        return minutes
    }
    var place: Place = Place()
    var isSelfOrgasm: Bool = false
    var watchedPorn: Bool = false
    var note: String = ""
    var rating: Int = 1
    var mood: Mood = Mood.neutral
    var Photo: String = "" // TODO: Change to Photo Object and Save to External Storage
    
    // MARK: Properties of Type Sex
    var mates: [Mate] = []
    var protection: Protection = Protection.no
    var promoter: Mate = Mate()
    var usedLingerie: Bool = false
    var ejaculated: Bool = false
    var squirted: Bool = false
    var ejaculationPosition: [EjaculationPosition] = []
    
    init() { }
    
    // MARK: - Activity Enumations
    enum ActivityType: String, Codable, CaseIterable {
        case sex = "Sex"
        case masturabation = "Masturabation"
        
        var color: Color {
            switch self {
            case .sex:
                return .purple
            case .masturabation:
                return .blue
            }
        }
    }
    
    enum Toy: String, Codable, CaseIterable {
        case handjob = "Handjob"
        case cup = "Cup"
        case vibrator = "Vibrator"
    }
    
    enum Protection: String, Codable, CaseIterable {
        case no = "No"
        case condom = "Condom"
        case pill = "Pill"
    }
    
    // MARK: - Activity Structs
    struct EjaculationPosition: Codable, Identifiable {
        private(set) var id: String = UUID().uuidString
        var name: String = ""
    }
}
