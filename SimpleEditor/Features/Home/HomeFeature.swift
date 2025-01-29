import ComposableArchitecture

@Reducer
struct HomeFeature {
    @Reducer
    enum Path {
        case add(AddFeature)
        case setting(SettingFeature)
    }
    
    @ObservableState
    struct State {
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case moveToAdd
        case moveToSetting
        case path(StackActionOf<Path>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .moveToAdd:
                state.path.append(.add(AddFeature.State()))
                return .none
            case .moveToSetting:
                state.path.append(.setting(SettingFeature.State()))
                return .none
            case let .path(action):
                switch action {
                default:
                    return .none
                }
            }
        }
        .forEach(\.path, action: \.path)
    }
}
