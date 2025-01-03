//
//  Mood.swift
//  XrecPrototype
//
//  Created by Majirefy on 2024/12/24.
//

import Foundation

enum Mood: String, Codable, CaseIterable {
    case excellent = "Excellent"
    case good = "Good"
    case neutral = "Neutral"
    case bad = "Bad"
    case terrible = "Terrible"
    
    var icon: String {
        switch self {
        case .excellent:
            return "😁"  // 大笑
        case .good:
            return "🙂"  // 微笑
        case .neutral:
            return "😐"  // 中立
        case .bad:
            return "🙁"  // 不开心
        case .terrible:
            return "😢"  // 哭泣
        }
    }
}
