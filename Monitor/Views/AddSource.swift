import SwiftUI

struct AddSource: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var modelData : ModelData
    @State var isDisabled : Bool = true
    
    @State var name : String = ""
    @State var address: String = ""
    
    var isFormValid: Bool {
        address.count > 0
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $name)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                TextField("Address", text: $address)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            
            Button("Add Source") {
                modelData.addSource(name: name, address: address)
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(!isFormValid)
        }
        .navigationBarTitle("Add New Source")
    }
}

struct AddSource_Previews: PreviewProvider {
    static var previews: some View {
        AddSource()
    }
}
