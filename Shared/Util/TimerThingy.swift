//
//  TimerThingy.swift
//  Monitor
//
//  Created by Bryce Mecum on 2/23/21.
//

import Foundation

class MyObserveableObject : ObservableObject {
    @Published var value: Int = 0
    
    
    var timer = Timer()
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("timer interval")

                let once = try? SwiftyPing(host: "1.1.1.1", configuration: PingConfiguration(interval: 1), queue: DispatchQueue.global())
                once?.observer = { (response) in
                    print("ping response")
                    let val = Int(Double(response.duration!) * 1000)
                    print("\(val)")
                    self.value = val
                }
                once?.targetCount = 1
                try? once?.startPinging()
        }
    }
    
    func stop() {
        timer.invalidate()
    }
    
    func reset() {
        value = 0;
        timer.invalidate()
    }
}
