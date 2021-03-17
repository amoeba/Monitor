//
//  ContentView.swift
//  Shared
//
//  Created by Bryce Mecum on 1/25/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack{
            HStack{
                Text("Monitor")
                    .font(.largeTitle)
                Spacer()
                Button("+ Add", action: {
                    print("Hi")
                })
                .padding(10.0)
            }
            SourcesList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
