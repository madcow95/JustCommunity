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
            case .setPhotoSheet(let isPresented):
                state.isPhotoSheetPresented = isPresented
                return .none
            }
        }
    }
}
