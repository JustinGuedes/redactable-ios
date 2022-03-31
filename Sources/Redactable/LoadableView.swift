import SwiftUI

public struct LoadableView<
    T,
    LoadingView: View,
    LoadedView: View,
    ErrorView: View
>: View {
    
    @Binding
    var loadable: Loadable<T>
    
    var loading: () -> LoadingView
    var loaded: (T) -> LoadedView
    var error: (Error) -> ErrorView
    
    public init(_ loadable: Binding<Loadable<T>>,
                @ViewBuilder loading: @escaping () -> LoadingView,
                @ViewBuilder loaded: @escaping (T) -> LoadedView,
                @ViewBuilder error: @escaping (Error) -> ErrorView) {
        self._loadable = loadable
        self.loading = loading
        self.loaded = loaded
        self.error = error
    }
    
    public var body: some View {
        switch loadable {
        case .loading:
            loading()
                .disabled(true)
        case .loaded(let data):
            loaded(data)
        case .error(let _error):
            error(_error)
        }
    }
    
}

public extension LoadableView where ErrorView == EmptyView {
    
    init(_ loadable: Binding<Loadable<T>>,
         @ViewBuilder loading: @escaping () -> LoadingView,
         @ViewBuilder loaded: @escaping (T) -> LoadedView) {
        self.init(loadable,
                  loading: loading,
                  loaded: loaded,
                  error: EmptyView.init)
    }
    
}

public extension LoadableView where T: Redactable, LoadingView == RedactableView<T, LoadedView> {
    
    init(_ loadable: Binding<Loadable<T>>,
         @ViewBuilder loaded: @escaping (T) -> LoadedView,
         @ViewBuilder error: @escaping (Error) -> ErrorView) {
        let loading = RedactableView.create(loaded)
        self.init(loadable,
                  loading: loading,
                  loaded: loaded,
                  error: error)
    }
    
    init(_ loadable: Binding<Loadable<T>>,
         @ViewBuilder loaded: @escaping (T) -> LoadedView)
    where ErrorView == EmptyView {
        self.init(loadable,
                  loaded: loaded,
                  error: EmptyView.init)
    }
    
}

extension EmptyView {
    
    init(error: Error) {
        self.init()
    }
    
}
