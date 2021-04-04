import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData

    private func addNewSource() {
        let newSource = Source(id: 3, name: "name", address: "1.1.1.1")
        modelData.sources.append(newSource)
    }
    
    var body: some View {
        VStack {
            HStack() {
                Text("Monitor")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading, 10.0)
            SourcesList()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Add New Source")
            })
            .padding(.vertical, 15.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
