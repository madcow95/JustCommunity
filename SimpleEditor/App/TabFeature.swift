import ComposableArchitecture

@Reducer
struct TabFeature {
    @ObservableState
    struct State {
        var selectedTab: TabOption = .home
        var home = HomeFeature.State()
        var setting = ProfileFeature.State()
        var isAddViewPresent: Bool = false
    }
    
    enum Action {
        case pageMove(TabOption)
        case home(HomeFeature.Action)
        case setting(ProfileFeature.Action)
        case setSheet(isPresented: Bool)
        case addViewDismiss
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.home, action: \.home) {
            HomeFeature()
        }
        Scope(state: \.setting, action: \.setting) {
            ProfileFeature()
        }
        Reduce { state, action in
            switch action {
            case .pageMove(let tabOption):
                state.selectedTab = tabOption
                return .none
            case .setSheet(isPresented: true):
                state.isAddViewPresent = true
                return .none
            case .setSheet(isPresented: false):
                state.isAddViewPresent = false
                return .none
            case .addViewDismiss:
                state.isAddViewPresent = false
                state.selectedTab = .home
                return .none
            default:
                return .none
            }
        }
    }
}

public enum TabOption: Hashable, CaseIterable {
    case home
    case add
    case setting
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .add: return "Add"
        case .setting: return "Profile"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .add: return "plus"
        case .setting: return "person"
        }
    }
}
