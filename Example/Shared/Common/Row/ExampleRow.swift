import Foundation
import Redactable

struct ExampleRow: Identifiable {
    var id: String
    var title: String
    var subtitle: String
    var detail: String
}

extension ExampleRow: Redactable {
    
    static var placeholder: ExampleRow {
        return ExampleRow(id: UUID().uuidString,
                          title: .placeholder,
                          subtitle: .placeholder,
                          detail: .placeholder)
    }
    
}

extension ExampleRow {
    
    static var data: [ExampleRow] {
        return [
            ExampleRow(id: "alpha",
                       title: "Alpha",
                       subtitle: "a as in English father, but short",
                       detail: "α"),
            
            ExampleRow(id: "beta",
                       title: "Beta",
                       subtitle: "v as in English vote",
                       detail: "β"),
            
            ExampleRow(id: "gamma",
                       title: "Gamma",
                       subtitle: "g as in Spanish lago or y as in English yellow, ng as in English long",
                       detail: "γ"),
        ]
    }
    
}
