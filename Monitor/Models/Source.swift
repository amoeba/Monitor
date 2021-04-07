import Foundation
import SwiftUI
import CoreLocation

struct Source: Hashable, Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var address: String
    var lastPing: String?
    var lastPingUnit: String?
    var lastPingGrade: Int?
}

enum PingGrade : Int {
    case good = 0
    case okay = 1
    case bad = 2
}
