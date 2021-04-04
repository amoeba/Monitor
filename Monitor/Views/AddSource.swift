//
//  AddSource.swift
//  Monitor (iOS)
//
//  Created by Bryce Mecum on 4/3/21.
//

import SwiftUI

struct AddSource: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var modelData : ModelData
    @State var isDisabled : Bool = true
    
    @State var name : String = ""
    @State var address: String = ""
    
    var isFormValid: Bool {
        name.count > 0 && address.count > 0
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $name)
                TextField("Address", text: $address)
            }
            
            Button("Add Source") {
                modelData.addSource(name: name, address: address)
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(!isFormValid)
        }
        .navigationTitle("Add New Source")
    }
}

struct AddSource_Previews: PreviewProvider {
    static var previews: some View {
        AddSource()
    }
}
