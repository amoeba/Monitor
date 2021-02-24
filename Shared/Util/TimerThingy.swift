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
            self.value += Int.random(in: 1...100)
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
