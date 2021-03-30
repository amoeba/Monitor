//
//  SourceDetail.swift
//  Monitor
//
//  Created by Bryce Mecum on 2/23/21.
//

import SwiftUI

struct SourceDetail: View {
    @EnvironmentObject var modelData: ModelData
    
    var source: Source
    
    var sourceIndex: Int {
        modelData.sources.firstIndex(where: { $0.id == source.id })!
    }
        
    var body: some View {
        Text(source.name)
//        Form {
//            TextField("Name", text: $modelData.sources[sourceIndex].name)
//                .padding(.vertical, 10.0)
//            TextField("Address", text: $modelData.sources[sourceIndex].address)
//                .padding(.vertical, 10.0)
//        }
        .navigationTitle("Edit Source")

    }
}

struct SourceDetail_Previews: PreviewProvider {
    static var previews: some View {
        SourceDetail(source: ModelData().sources[0])
            .environmentObject(ModelData())
    }
}
