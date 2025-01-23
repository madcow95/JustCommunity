import SwiftUI

struct CustomButton: View {
    let title: String?
    let image: String?
    let color: Color
    let action: (() -> Void)?
    
    init(title: String? = nil, image: String? = nil, color: Color, action: (() -> Void)? = nil) {
        self.title = title
        self.image = image
        self.color = color
        self.action = action
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            if let title = title {
                Text(title)
            }
            
            if let image = image {
                Image(systemName: image)
                    .tint(color)
            }
        }
    }
}
