import SwiftUI

public struct RedactableView<T: Redactable, Content: View>: View {
    
    @State
    var opacity = 1.0
    
    var redactable: T
    var content: (T) -> Content

    public init(redactable: T, @ViewBuilder content: @escaping (T) -> Content) {
        self.redactable = redactable
        self.content = content
    }
    
    public init(@ViewBuilder content: @escaping (T) -> Content) {
        self.init(redactable: .placeholder, content: content)
    }
    
    var animation: Animation {
        .easeInOut(duration: 1)
        .repeatForever(autoreverses: true)
    }
    
    public var body: some View {
        content(redactable)
            .redacted(reason: .placeholder)
            .opacity(opacity)
            .animation(animation, value: opacity)
            .onAppear {
                withAnimation {
                    opacity = 0.25
                }
            }
            
    }
    
}

extension RedactableView {
    
    static func create(@ViewBuilder _ loadedView: @escaping (T) -> Content) -> () -> RedactableView {
        return {
            RedactableView { redactable in
                loadedView(redactable)
            }
        }
    }
    
}
