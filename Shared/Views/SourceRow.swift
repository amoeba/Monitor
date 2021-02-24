//
//  SourceRow.swift
//  Monitor
//
//  Created by Bryce Mecum on 2/23/21.
//

import SwiftUI

struct SourceRow: View {
    var source: Source
    
    var body: some View {
        HStack {
            VStack {
                Text(source.name)
                Text(source.address)
                    .font(.caption)

                    .foregroundColor(.gray)
            }
            .frame(alignment: .leading)
            
            Spacer()
            
            Text("192ms")
                .frame(alignment: .trailing)
        }
        .padding()
    }
}

struct SourceRow_Previews: PreviewProvider {
    static var previews: some View {
        SourceRow(source: ModelData().sources[0])
    }
}
