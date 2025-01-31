import Foundation
import ComposableArchitecture

@Reducer
struct AddFeature {
    
    @ObservableState
    struct State {
        var isPhotoSheetPresented: Bool = false
    }
    
    enum Action {
        case setPhotoSheet(isPresented: Bool)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .setPhotoSheet(isPresented: true):
                state.isPhotoSheetPresented = true
                return .none
            case .setPhotoSheet(isPresented: false):
                state.isPhotoSheetPresented = false
                return .none
            }
        }
    }
}
