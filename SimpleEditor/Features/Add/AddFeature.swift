import SwiftUI
import ComposableArchitecture
import PhotosUI

@Reducer
struct AddFeature {
    
    @ObservableState
    struct State {
        var selectedPictures: [PhotosPickerItem] = []
        var selectedImages: [UIImage] = []
    }
    
    enum Action {
        case setSelectedPictures([PhotosPickerItem])
        case loadSelectedImages([PhotosPickerItem])
        case setPhotos([UIImage])
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .setSelectedPictures(let items):
                return .send(.loadSelectedImages(items))
            case .loadSelectedImages(let pictures):
                return .run { state in
                    var images: [UIImage] = []
                    for picture in pictures {
                        if let data = try? await picture.loadTransferable(type: Data.self), let image = UIImage(data: data) {
                            images.append(image)
                        }
                    }
                    await state.callAsFunction(.setPhotos(images))
                }
            case .setPhotos(let images):
                state.selectedImages = images
                return .none
            }
        }
    }
}
