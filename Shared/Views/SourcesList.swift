//
//  SourcesList.swift
//  Monitor
//
//  Created by Bryce Mecum on 3/16/21.
//

import SwiftUI

struct SourcesList: View {
    @EnvironmentObject var modelData: ModelData

    var filteredSources: [Source] {
        modelData.sources.filter { landmark in
            true
        }
    }
    
    var body: some View {
        List {
            ForEach(filteredSources) { source in
                SourceRow(source: source)
            }
        }
    }
}

struct SourcesList_Previews: PreviewProvider {
    static var previews: some View {
        SourcesList()
            .environmentObject(ModelData())
    }
}
