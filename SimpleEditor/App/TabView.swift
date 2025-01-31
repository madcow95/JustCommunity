import SwiftUI
import ComposableArchitecture

struct CustomTabView: View {
    @Bindable var store: StoreOf<TabFeature>
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch store.selectedTab {
                case .home:
                    HomeView(store: store.scope(state: \.home, action: \.home))
                case .add:
                    EmptyView()
                case .setting:
                    ProfileView(store: store.scope(state: \.setting, action: \.setting))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                ForEach(TabOption.allCases, id: \.self) { option in
                    TabButton(tab: option, isSelected: store.selectedTab == option) {
                        if option == .add {
                            store.send(.setSheet(isPresented: true))
                        } else {
                            store.send(.pageMove(option))
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $store.isAddViewPresent.sending(\.setSheet)) {
            AddView(store: Store(initialState: AddFeature.State(), reducer: {
                AddFeature()
            }), dismiss: {
                store.send(.addViewDismiss)
            })
        }
    }
}


