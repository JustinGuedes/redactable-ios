import Foundation

public protocol Redactable {
    static var placeholder: Self { get }
}

extension Array: Redactable where Element: Redactable {
    
    public static var placeholder: [Element] {
        return [.placeholder]
    }
    
}

extension String: Redactable {
    
    public static var placeholder: String {
        return "Placeholder"
    }
    
}
