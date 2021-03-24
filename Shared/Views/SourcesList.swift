import SwiftUI

struct SourcesList: View {
    @EnvironmentObject var modelData: ModelData
    
    func delete(at offsets: IndexSet) {
        modelData.sources.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.sources) { source in
                    NavigationLink(destination: SourceDetail(source: source)) {
                        SourceRow(source: source)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle(nil)
            .navigationBarHidden(true)
        }
    }
}

struct SourcesList_Previews: PreviewProvider {
    static var previews: some View {
        SourcesList()
            .environmentObject(ModelData())
    }
}
