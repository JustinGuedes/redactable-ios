import SwiftUI
import Redactable

struct DefaultView: View {

    @StateObject
    var viewModel: ViewModel = .init()

    var body: some View {
        VStack {
            LoadableView($viewModel.loadable) { rows in
                List(rows) { row in
                    ExampleRowView(data: row)
                }
                .refreshable {
                    viewModel.loadData()
                }
            }
        }
        .navigationTitle("Default")
        .onAppear(perform: viewModel.loadData)
    }

}

struct DefaultLoadableView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DefaultView()
        }
    }
}
