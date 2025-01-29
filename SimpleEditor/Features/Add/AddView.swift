import SwiftUI
import ComposableArchitecture

struct AddView: View {
    @Bindable var store: StoreOf<AddFeature>
    
    var body: some View {
        Text("Add View")
    }
}
