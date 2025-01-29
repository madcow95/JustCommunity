import SwiftUI
import ComposableArchitecture

struct CustomTabView: View {
    @Bindable var store: StoreOf<TabFeature>
    
    var body: some View {
        TabView(selection: $store.selectedTab.sending(\.pageMove)) {
            Tab("Home", systemImage: "house.fill", value: TabOption.home) {
                HomeView(store: store.scope(state: \.home, action: \.home))
            }
            
            Tab("Add", systemImage: "plus", value: TabOption.add) {
                AddView(store: store.scope(state: \.add, action: \.add))
            }
            
            Tab("Profile", systemImage: "person.fill", value: TabOption.setting) {
                SettingView(store: store.scope(state: \.setting, action: \.setting))
            }
        }
        .tint(.primaryColor)
    }
}
