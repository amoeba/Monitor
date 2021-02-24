//
//  SourceRow.swift
//  Monitor
//
//  Created by Bryce Mecum on 2/23/21.
//

import SwiftUI

struct SourceRow: View {
    var source: Source
    
    @State var ping = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
            
            Text("\(ping)ms")
                .onReceive(timer) { input in
                    ping = Int.random(in: 1...100)
                }
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
