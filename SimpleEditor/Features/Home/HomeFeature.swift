import Foundation
import ComposableArchitecture

@Reducer
struct HomeFeature {
    @ObservableState
    struct State: Equatable {
        var path = StackState<SettingFeature.State>()
    }
    
    enum Action {
        case path(StackAction<SettingFeature.State, SettingFeature.Action>)
        case moveToSetting
        case presentGallery
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path:
                return .none
            case .moveToSetting:
                state.path.append(SettingFeature.State())
                return .none
            case .presentGallery:
                
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            SettingFeature()
        }
    }
}
