import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: DefaultView.init) {
                    Label("Default", systemImage: "hourglass")
                }
                
                NavigationLink(destination: CustomLoadingView.init) {
                    Label("Custom Loading", systemImage: "goforward")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Examples")
            
            Text("Select an example")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
