import SwiftUI

struct SourcesList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var editMode = EditMode.inactive
    
    private func delete(at offsets: IndexSet) {
        modelData.sources.remove(atOffsets: offsets)
        modelData.save()
    }

    private func move(source: IndexSet, destination: Int) {
        modelData.sources.move(fromOffsets: source, toOffset: destination)
        modelData.save()
    }

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
                .onDelete(perform: delete)
                .onMove(perform: move)
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
