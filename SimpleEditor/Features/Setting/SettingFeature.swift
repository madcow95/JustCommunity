import ComposableArchitecture

@Reducer
struct SettingFeature {
    @ObservableState
    struct State {
        
    }
    
    enum Action {
        case toRootView
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .toRootView:
                return .none
            }
        }
    }
}
