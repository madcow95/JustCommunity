import ComposableArchitecture

@Reducer
struct ProfileFeature {
    @Reducer
    enum Path {
        case setting(SettingFeature)
    }
    
    @ObservableState
    struct State {
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case path(StackActionOf<Path>)
        case moveToSetting
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .moveToSetting:
                state.path.append(.setting(.init()))
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
