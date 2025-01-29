import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>
    
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            VStack {
                Text("TEST")
            }
            .navigationTitle("HomeView")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        store.send(.moveToAdd)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .tint(.primaryColor)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        store.send(.moveToSetting)
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                    .tint(.primaryColor)
                }
            }
        } destination: { store in
            switch store.case {
            case let .add(store):
                AddView(store: store)
            case let .setting(store):
                SettingView(store: store)
            }
        }
    }
}
