import Foundation
import SwiftUI
import CoreLocation

struct PingThingy {
    var ping: Int
    
    public init(fromDuration duration: Double?) {
        ping = Int(round(duration! * 1000))
    }
    
    func getPing() -> String {
        return String(ping)
    }
    
    func getUnit() -> String {
        return "ms"
    }
    
    func getGrade() -> Int {
        if (ping < 100) {
            return PingGrade.good.rawValue
        } else if (ping >= 100 && ping < 300) {
            return PingGrade.okay.rawValue
        } else {
            return PingGrade.bad.rawValue
        }
    }
}
