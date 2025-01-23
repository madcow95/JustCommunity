import Foundation
import ComposableArchitecture

@Reducer
struct HomeFeature {
    @ObservableState
    struct HomeState {
        var number: Int = 0
    }
    
    enum HomeAction {
        case addNumber
        case minusNumber
    }
    
    var body: some Reducer<HomeState, HomeAction> {
        Reduce { state, action in
            switch action {
            case .addNumber:
                state.number += 1
                return .none
            case .minusNumber:
                state.number -= 1
                return .none
            }
        }
    }
}
