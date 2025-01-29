import Foundation
import ComposableArchitecture

@Reducer
struct AddFeature {
    
    @ObservableState
    struct State {
        var isPhotoSheetPresented: Bool = false
    }
    
    enum Action {
        case setSheet(isPresented: Bool)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .setSheet(isPresented: true):
                state.isPhotoSheetPresented = true
                return .none
            case .setSheet(isPresented: false):
                state.isPhotoSheetPresented = false
                return .none
            }
        }
    }
}
