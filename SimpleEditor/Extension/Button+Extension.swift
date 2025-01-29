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

struct TabButton: View {
    let tab: TabOption
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: tab.icon)
                    .font(.system(size: 20, weight: .semibold))
                    .symbolVariant(isSelected ? .fill : .none)
                
                Text(tab.title)
                    .font(.system(size: 12, weight: isSelected ? .bold : .medium))
            }
            .foregroundStyle(isSelected ? .primaryColor : Color.gray)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.none, value: configuration.isPressed)
    }
}
