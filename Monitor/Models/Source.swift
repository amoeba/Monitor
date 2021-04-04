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
