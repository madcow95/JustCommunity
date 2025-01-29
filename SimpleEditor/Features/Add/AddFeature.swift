import ComposableArchitecture

@Reducer
struct AddFeature {
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        case popView
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .popView:
                return .none
            }
        }
    }
}
