//
//  MonitorApp.swift
//  Shared
//
//  Created by Bryce Mecum on 1/25/21.
//

import SwiftUI

@main
struct MonitorApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
