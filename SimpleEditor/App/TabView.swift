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
                    // 어떤 옵션을 주지..?
                    AddView(store: store.scope(state: \.add, action: \.add))
                case .setting:
                    SettingView(store: store.scope(state: \.setting, action: \.setting))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                ForEach(TabOption.allCases, id: \.self) { option in
                    TabButton(tab: option, isSelected: store.selectedTab == option) {
                        if option == .add {
                            
                        } else {
                            store.send(.pageMove(option))
                        }
                    }
                }
            }
        }
    }
}


