import Foundation
import ComposableArchitecture

@Reducer
struct HomeFeature {
    @ObservableState
    struct State: Equatable {
        var path = StackState<Path.State>()
        @Presents var photoFeature: PhotoFeature.State?
    }
    
    enum Action {
        case path(StackAction<Path.State, Path.Action>)
        case moveToSetting
        case moveToAdd
        case photoFeature(PresentationAction<PhotoFeature.Action>)
        case presentGallery
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .moveToSetting:
                state.path.append(.setting(SettingFeature.State()))
                return .none
            case .moveToAdd:
                state.path.append(.add(AddFeature.State()))
                return .none
            case .presentGallery:
                state.photoFeature = PhotoFeature.State()
                return .none
            case .photoFeature(.presented(.dismissGallery)):
                state.photoFeature = nil
                return .none
            default:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
        .ifLet(\.$photoFeature, action: \.photoFeature) {
            PhotoFeature()
        }
    }
}

@Reducer
struct Path {
    @ObservableState
    enum State: Equatable {
        case setting(SettingFeature.State)
        case add(AddFeature.State)
    }
    
    enum Action {
        case setting(SettingFeature.Action)
        case add(AddFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.setting, action: \.setting) {
            SettingFeature()
        }
        Scope(state: \.add, action: \.add) {
            AddFeature()
        }
    }
}
