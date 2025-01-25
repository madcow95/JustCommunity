import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>
    
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            VStack {
                Text("store Number: hello world")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Spacer()
                        CustomButton(image: "gearshape.fill",
                                     color: .primaryColor) {
                            store.send(.moveToSetting)
                        }
                        CustomButton(image: "plus",
                                     color: .primaryColor) {
                            
                        }
                    }
                }
            }
        } destination: { store in
            SettingView(store: store)
        }
        .background(Color.primaryBackgroundColor)
    }
}
