//
//  SourceRow.swift
//  Monitor
//
//  Created by Bryce Mecum on 2/23/21.
//

import SwiftUI

struct SourceRow: View {
    @EnvironmentObject var modelData: ModelData
    @State var ping : Int = 101
    
    var source: Source
    
    var sourceIndex: Int {
        modelData.sources.firstIndex(where: { $0.id == source.id })!
    }

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        HStack() {
            VStack {
                Text(source.name)
                Text(source.address)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(alignment: .leading)
            
            Spacer()
            
            Text("\(String(ping))ms")
                .onReceive(timer, perform: { _ in
                    ping = ping + 1
                })
                .frame(alignment: .trailing)
        }
        .padding()
//        .onAppear(perform: fetch)
    }
    
//    private func fetch() {
//        DispatchQueue.global(qos: .background).async {
//            print("Updating from background...")
//
//
//            // Not sure if this is right. What about all this weak self stuff?
//            DispatchQueue.main.async {
//                self.ping = self.ping + 1
//            }
//        }
//    }
}

struct SourceRow_Previews: PreviewProvider {
    static var previews: some View {
        SourceRow(source: ModelData().sources[0])
    }
}
