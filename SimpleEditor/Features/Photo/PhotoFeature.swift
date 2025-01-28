import SwiftUI
import ComposableArchitecture

@Reducer
struct PhotoFeature {
    @ObservableState
    struct State: Equatable {
        var videoURL: URL?
    }
    
    enum Action {
        case videoSelected(URL)
        case dismissGallery
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case let .videoSelected(url):
                state.videoURL = url
                return .none
            case .dismissGallery:
                return .none
            }
        }
    }
}
