import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                ScrollView {
                    VStack {
                        Text("TEST")
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack {
                                Spacer()
                                CustomButton(image: "gearshape.fill",
                                             color: Color.white) {
                                    store.send(.moveToSetting)
                                }
                                CustomButton(image: "plus",
                                             color: Color.white) {
                                    store.send(.moveToAdd)
                                }
                            }
                        }
                    }
                }
                .sheet(item: $store.scope(state: \.photoFeature, action: \.photoFeature)) { photoStore in
                    NavigationStack {
                        VideoPickerView(store: photoStore)
                    }
                }
            } destination: { store in
                switch store.state {
                case .setting:
                    SettingView(store: store)
                case .add:
                    AddView(store: store)
                }
            }
        }
    }
}
