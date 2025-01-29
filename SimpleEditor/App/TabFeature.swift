import ComposableArchitecture

@Reducer
struct TabFeature {
    @ObservableState
    struct State {
        var selectedTab: TabOption = .home
        var home = HomeFeature.State()
        var add = AddFeature.State()
        var setting = SettingFeature.State()
    }
    
    enum Action {
        case pageMove(TabOption)
        case home(HomeFeature.Action)
        case add(AddFeature.Action)
        case setting(SettingFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.home, action: \.home) {
            HomeFeature()
        }
        Scope(state: \.add, action: \.add) {
            AddFeature()
        }
        Scope(state: \.setting, action: \.setting) {
            SettingFeature()
        }
        Reduce { state, action in
            switch action {
            case .pageMove(let tabOption):
                state.selectedTab = tabOption
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
