import SwiftUI

struct SourcesList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            List {
                ForEach(modelData.sources) { source in
                    SourceRow(source: source)
                }
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
