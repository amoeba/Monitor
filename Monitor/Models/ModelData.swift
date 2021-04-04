//
//  ModelData.swift
//  Landmarks
//
//  Created by Bryce Mecum on 2/20/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var sources: [Source]
    
    weak var timer: Timer?
    let interval = 1.0
    let filename : String = "sources.json"
    
    init(){
        sources = []
        sources = load(filename)
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
            
            // Dummy data for now until I can figure out accurate pingin
            self.sources[sourceIndex].lastPing = formatPing(duration: Double.random(in: 0...1))
            self.sources[sourceIndex].lastPingUnit = "ms"
        }
    }
    
    func formatPing(duration: Double?) -> String {
        if duration != nil {
            return "\(Int(round(duration! * 1000)))"
        } else {
            return "..."
        }
    }
    
    func addSource(name: String, address: String) {
        NSLog("Adding new source: \(name), \(address)")
        
        let newSource = Source(name: name, address: address)
        self.sources.append(newSource)
        
        save()
    }
    
    func deleteSource(at offsets: IndexSet) {
        sources.remove(atOffsets: offsets)
        save()
    }

    func moveSource(source: IndexSet, destination: Int) {
        sources.move(fromOffsets: source, toOffset: destination)
        save()
    }
    
    func deleteSource(source: Source) -> Void {
        if let index = self.sources.firstIndex(where: { $0.id == source.id }) {
            sources.remove(at: index)
            save()
        }
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    func save() {
        NSLog("Saving...")
        
        var file = getDocumentDirectory()
        file.appendPathComponent("sources.json")
        
        NSLog("Save file is \(file)")
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        let json: Data
        
        do {
            json = try encoder.encode(sources)
        } catch {
            fatalError("Couldn't encode:\n\(error)")
        }
        
        do {
            try json.write(to: file)
        } catch {
            fatalError("Couldn't write to \(file):\n\(error)")
        }
        
        NSLog("Saved")
    }
    
    func load(_ filename: String) -> [Source] {
        NSLog("Loading...")
        
        let data: Data
        let decoder = JSONDecoder()
        var sources: [Source] = []
        
        var file = getDocumentDirectory()
        file.appendPathComponent("sources.json")
        
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: file.absoluteString) {
            NSLog("Sources file does not exist, loading default list")
            
            return loadDefaults("defaultSources.json")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
        }
        
        do {
            sources = try decoder.decode([Source].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename):\n\(error)")
        }
        
        NSLog("Loaded \(sources.count) sources from \(file)")
        
        return sources
    }
}

func loadDefaults<T: Decodable>(_ filename: String) -> T {
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
