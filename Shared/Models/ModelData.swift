//
//  ModelData.swift
//  Landmarks
//
//  Created by Bryce Mecum on 2/20/21.
//

import Foundation
import Combine
import SwiftyPing

final class ModelData: ObservableObject {
    @Published var sources: [Source] = load("sources.json")
    
    weak var timer: Timer?
    let interval = 1.0
    
    init(){
        startTimer()
    }
    
    deinit {
        stopTimer()
    }
    
    func startTimer() {
        stopTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            self?.updateList()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func updateList() {
        self.sources.forEach { source in
            var sourceIndex: Int {
                self.sources.firstIndex(where: { $0.id == source.id })!
            }
            
            let once = try? SwiftyPing(host: source.address, configuration: PingConfiguration(interval: 1, with: 5), queue: DispatchQueue.global())
            once?.observer = { (response) in
                let duration = response.duration
                
                self.sources[sourceIndex].lastPing = Int(round((duration ?? -1) * 1000))
            }
            once?.targetCount = 1
            try? once?.startPinging()
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
