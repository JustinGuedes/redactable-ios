import SwiftUI

struct ExampleRowView: View {
    
    var data: ExampleRow
    
    var body: some View {
        HStack {
            Image(systemName: "circle.hexagongrid.circle")
            
            VStack(alignment: .leading) {
                Text(data.title)
                    .font(.headline)
                
                Text(data.subtitle)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Text(data.detail)
                .font(.body)
                .fontWeight(.light)
        }
        .padding()
    }
    
}

struct ExampleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleRowView(data: .placeholder)
            .previewLayout(.sizeThatFits)
    }
}
