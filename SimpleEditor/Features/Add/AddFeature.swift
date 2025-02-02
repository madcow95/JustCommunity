import SwiftUI
import ComposableArchitecture
import PhotosUI

@Reducer
struct AddFeature {
    
    @ObservableState
    struct State {
        var isPhotoSheetPresented: Bool = false
        var selectedPictures: [PhotosPickerItem] = []
        var selectedImages: [UIImage] = []
    }
    
    enum Action {
        case setPhotoSheet(isPresented: Bool)
        case setSelectedPictures([PhotosPickerItem])
        case loadSelectedImages
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .setPhotoSheet(let isPresented):
                state.isPhotoSheetPresented = isPresented
                return .none
            case .setSelectedPictures(let items):
                state.selectedPictures = items
                return .send(.loadSelectedImages)
            case .loadSelectedImages:
                print("선택된 이미지 숫자 >>> ",state.selectedPictures.count)
                return .none
            }
        }
    }
}
