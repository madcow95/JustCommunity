import Foundation
import ComposableArchitecture

@Reducer
struct HomeFeature {
    @ObservableState
    struct HomeState {
        var destination: DestinationCase?
    }
    
    enum HomeAction {
        case moveToSetting(DestinationCase)
        case clearDestination
    }
    
    var body: some Reducer<HomeState, HomeAction> {
        Reduce { state, action in
            switch action {
            case .moveToSetting(let destination):
                state.destination = destination
                return .none
            case .clearDestination:
                state.destination = nil
                return .none
            }
        }
    }
}
