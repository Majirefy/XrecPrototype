//
//  Place.swift
//  XrecPrototype
//
//  Created by Majirefy on 2024/12/24.
//

import Foundation
import MapKit

struct Place: Codable, Identifiable {
    private(set) var id: String = UUID().uuidString
    var name: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
}
