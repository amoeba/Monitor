//
//  NewSourceView.swift
//  Monitor
//
//  Created by Bryce Mecum on 3/30/21.
//

import SwiftUI

struct NewSourceView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var name : String = "Cloudflare"
    @State var address : String = "1.1.1.1"

    private func addSource() {
        var newSource = Source(id: 3, name: name, address: address)
        
        newSource.name = name
        newSource.address = address
        
        modelData.sources.append(newSource)
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Address", text: $address)
            }
            .navigationBarTitle("Add Source")
        }
    }
}

struct NewSourceView_Previews: PreviewProvider {
    static var previews: some View {
        NewSourceView()
    }
}
