//
//  ContentView.swift
//  Shared
//
//  Created by Bryce Mecum on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var isShowingAddView = false
    
    var body: some View {
        NavigationView {
            VStack {
                SourcesList()
                NavigationLink(destination: AddSource(), isActive: $isShowingAddView) { EmptyView() }
                Button("Tap to show detail") {
                    self.isShowingAddView = true
                }
                NavigationLink(destination: AddSource()) {
                    Text("Add New Source")
                }
            }
        }
        .navigationBarTitle("Monitor")

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
