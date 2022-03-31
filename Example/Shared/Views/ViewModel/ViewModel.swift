import SwiftUI
import Redactable

class ViewModel: ObservableObject {
    
    @Published
    var loadable: Loadable<[ExampleRow]> = .loading
    
    func loadData() {
        loadable = .loading
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 5) { [self] in
            let result = ExampleRow.data
            DispatchQueue.main.async { [self] in
                loadable = .loaded(result)
            }
        }
    }
    
}
