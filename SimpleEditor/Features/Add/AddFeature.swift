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
//        case setSheetIsPresentedDelayCompleted
    }
    
//    @Dependency(\.continuousClock) var clock
//    private enum CancelID { case load }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .setSheet(isPresented: true):
                state.isPhotoSheetPresented = true
                return .none
            case .setSheet(isPresented: false):
                state.isPhotoSheetPresented = false
                return .none
//                return .run { send in
//                    try await self.clock.sleep(for: .seconds(1))
//                    await send(.setSheetIsPresentedDelayCompleted)
//                }
//                .cancellable(id: CancelID.load)
            }
        }
    }
}
