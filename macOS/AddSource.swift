import SwiftUI

struct AddSource: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var modelData : ModelData
    @State var isDisabled : Bool = true
    @Binding var isAddShowing: Bool
    
    @State var name : String = ""
    @State var address: String = ""
    
    var isFormValid: Bool {
        address.count > 0
    }
    
    var body: some View {
        Form {
            HStack {
                TextField("Name", text: $name)
                TextField("Address", text: $address)
                Button("Add") {
                    modelData.addSource(name: name, address: address)
                    self.presentationMode.wrappedValue.dismiss()
                    isAddShowing = false
                }
            }
        }
    }
}

struct AddSource_Previews: PreviewProvider {

    static var previews: some View {
        AddSource(isAddShowing: .constant(true))
    }
}
