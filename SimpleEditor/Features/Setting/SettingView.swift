import SwiftUI
import ComposableArchitecture

struct SettingView: View {
    @Bindable var store: StoreOf<SettingFeature>
    
    var body: some View {
        NavigationStack {
            
        }
        .navigationTitle("Setting View")
    }
}
