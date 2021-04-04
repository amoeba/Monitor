//
//  Landmark.swift
//  Landmarks
//
//  Created by Bryce Mecum on 2/20/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Source: Hashable, Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var address: String
    var lastPing: String?
    var lastPingUnit: String?
}
