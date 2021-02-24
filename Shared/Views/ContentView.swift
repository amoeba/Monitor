//
//  ContentView.swift
//  Shared
//
//  Created by Bryce Mecum on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var filteredSources: [Source] {
        modelData.sources.filter { landmark in
            true
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredSources) { source in
                    NavigationLink(destination: SourceDetail(source: source)) {
                        SourceRow(source: source)
                    }
                }
            }
            .frame(minWidth: 250)
        }
        .navigationTitle("Sources")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
