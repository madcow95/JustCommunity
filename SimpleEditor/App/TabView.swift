import SwiftUI
import ComposableArchitecture

// MARK: 탭 버튼마다 다르게 동작하게 하기 위한 CustomTabView
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
                        // MARK: Add 버튼을 눌렀을 때는 sheet가 표시
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


