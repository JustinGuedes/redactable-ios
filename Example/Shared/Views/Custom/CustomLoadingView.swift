import SwiftUI
import Redactable

struct CustomLoadingView: View {
    
    @StateObject
    var viewModel: ViewModel = .init()
    
    var body: some View {
        VStack {
            LoadableView($viewModel.loadable) {
                ProgressView()
            } loaded: { rows in
                List(rows) { row in
                    ExampleRowView(data: row)
                }
                .refreshable {
                    viewModel.loadData()
                }
            }
        }
        .navigationTitle("Custom Loading")
        .onAppear(perform: viewModel.loadData)
    }
}

struct CustomLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoadingView()
    }
}
