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
        HStack() {
            VStack(alignment: .leading) {
                Text(source.name)
                Text(source.address)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack(alignment: .bottom, spacing: 0){
                Text(source.lastPing == nil ? "" : source.lastPing ?? "...")
                Text(source.lastPingUnit ?? "")
                    .font(.footnote)
            }
        }
        .padding(0)
    }
}

struct SourceRow_Previews: PreviewProvider {
    static var previews: some View {
        SourceRow(source: ModelData().sources[0])
    }
}
