import SwiftUI

struct SourcesList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var editMode = EditMode.inactive

    private func foo(){
        print("foo")
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                EditButton()
                    .padding(.trailing, 10.0)
            }
            List {
                ForEach(modelData.sources) { source in
                    SourceRow(source: source)
                }
                .onDelete(perform: modelData.deleteSource)
                .onMove(perform: modelData.moveSource)
            }
        }
    }
}

struct SourcesList_Previews: PreviewProvider {
    static var previews: some View {
        SourcesList()
            .environmentObject(ModelData())
    }
}
