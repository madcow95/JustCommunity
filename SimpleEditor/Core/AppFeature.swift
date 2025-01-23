import Foundation
import ComposableArchitecture

@Reducer
struct AppFeature {
    @ObservableState
    struct AppState: Equatable {
        var count: Int = 0
    }
    
    enum AppAction {
        case addCount
    }
    
    var body: some Reducer<AppState, AppAction> {
        Reduce { state, action in
            switch action {
            case .addCount:
                state.count += 1
                return .none
            }
        }
    }
}
