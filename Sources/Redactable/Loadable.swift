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
    
    var hasLoaded: Bool {
        switch self {
        case .loading:
            return false
        default:
            return true
        }
    }

    var hasError: Bool {
        switch self {
        case .error:
            return true
        default:
            return false
        }
    }

    func get() throws -> T {
        switch self {
        case .loaded(let data):
            return data
        case .error(let error):
            throw error
        default:
            throw LoadableError.incomplete
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
