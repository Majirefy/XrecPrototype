//
//  Mate.swift
//  XrecPrototype
//
//  Created by Majirefy on 2024/12/24.
//

import Foundation

struct Mate: Codable, Identifiable {
    private(set) var id: String = UUID().uuidString
    var name: String = ""
    var gender: Gender = Gender.female
    var avatar: String = "" // TODO: Change to Photo Object and Save to External Storage
    
    enum Gender: String, Codable, CaseIterable {
        case male = "male"
        case female = "female"
    }
}
