import Foundation

public enum Loadable<T> {
    case loading
    case loaded(T)
    case error(Error)
}

public extension Loadable {
    
    var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }
    
    static func from(_ result: Result<T, Error>) -> Loadable<T> {
        do {
            return .loaded(try result.get())
        } catch {
            return .error(error)
        }
    }
    
}
