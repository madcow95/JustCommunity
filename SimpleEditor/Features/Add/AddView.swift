import SwiftUI
import ComposableArchitecture
import PhotosUI

struct AddView: View {
    @Bindable var store: StoreOf<AddFeature>
    let dismiss: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $store.selectedPictures.sending(\.setSelectedPictures), matching: .images) {
                    Image(systemName: "photo.fill")
                        .tint(.primaryColor)
                        .frame(width: 200, height: 200)
                        .padding()
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(store.selectedImages, id: \.self) { img in
                            Image(uiImage: img)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .frame(height: 200)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("게시")
                            .tint(.primaryColor)
                    }
                }
            }
        }
    }
}
