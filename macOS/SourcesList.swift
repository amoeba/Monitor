import SwiftUI

struct SourcesList: View {
    @EnvironmentObject var modelData: ModelData
    @State var isAddSourceShowing: Bool = false
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button("+", action: toggleIsAddSourceShowing)
                    .font(.title2)
                    .padding(.all, 10.0)
            }
            List {
                ForEach(modelData.sources) { source in
                    SourceRow(source: source)
                        .contextMenu {
                            Button("Delete") {
                                modelData.deleteSource(source: source)
                            }
                        }
                }
                if (isAddSourceShowing) {
                    AddSource(isAddShowing: $isAddSourceShowing)
                }
            }
        }
    }
    
    private func toggleIsAddSourceShowing() {
        isAddSourceShowing = !isAddSourceShowing
    }
}

struct SourcesList_Previews: PreviewProvider {
    static var previews: some View {
        SourcesList()
            .environmentObject(ModelData())
    }
}

