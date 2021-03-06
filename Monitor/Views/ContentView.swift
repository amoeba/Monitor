import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            VStack {
                SourcesList()
                NavigationLink(destination: AddSource()) {
                    Text("Add New Source")
                        .padding(.top, 15.0)
                }
            }
            .navigationBarTitle("Monitor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
