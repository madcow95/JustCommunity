import Foundation
import ComposableArchitecture

@Reducer
struct HomeFeature {
    @ObservableState
    struct State: Equatable {
        var path = StackState<SettingFeature.State>()
        var isGalleryPresented: Bool = false
    }
    
    enum Action {
        case path(StackAction<SettingFeature.State, SettingFeature.Action>)
        case moveToSetting
        case showGallery
        case dismissGallery
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path:
                return .none
            case .moveToSetting:
                state.path.append(SettingFeature.State())
                return .none
            case .showGallery:
                state.isGalleryPresented = true
                return .none
            case .dismissGallery:
                state.isGalleryPresented = false
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            SettingFeature()
        }
    }
}
