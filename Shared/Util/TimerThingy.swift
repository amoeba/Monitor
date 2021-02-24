//
//  TimerThingy.swift
//  Monitor
//
//  Created by Bryce Mecum on 2/23/21.
//

import Foundation
import SwiftUI

class MyObserveableObject : ObservableObject {
    @Published var values: Dictionary<String, Double> = [:]
    
    var timer = Timer()
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            print("--- timer interval ---")
            
            ["localhost", "1.1.1.1"].forEach({ host in
                let once = try? SwiftyPing(host: host, configuration: PingConfiguration(interval: 1), queue: DispatchQueue.global())
                once?.observer = { (response) in
                    print("ping response \(host)")
                    let val = Double(response.duration!) * 1000
                    print("\(val)")
                    self.values[host] = val
                }
                once?.targetCount = 1
                try? once?.startPinging()
            })
        }
    }
    
    func stop() {
        timer.invalidate()
    }
    
    func reset() {
        values = [:];
        timer.invalidate()
    }
}
