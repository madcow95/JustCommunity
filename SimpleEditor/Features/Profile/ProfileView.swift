import SwiftUI
import ComposableArchitecture

struct ProfileView: View {
    @Bindable var store: StoreOf<ProfileFeature>
    
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            VStack {
                
            }
            .toolbar {
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
            case let .setting(store):
                SettingView(store: store)
            }
        }
    }
}
