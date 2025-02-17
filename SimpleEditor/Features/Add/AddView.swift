import SwiftUI
import ComposableArchitecture
import PhotosUI

struct AddView: View {
    @Bindable var store: StoreOf<AddFeature>
    @State var title: String = ""
    @State var content: String = ""
    let dismiss: () -> Void
    
    var body: some View {
        NavigationStack {
            ScrollView {
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
                    
                    VStack {
                        HStack {
                            Text("제목")
                                .font(.headline)
                                .bold()
                                .foregroundStyle(Color.white)
                            Spacer()
                        }
                        
                        TextField("제목을 입력하세요", text: $title)
                    }
                    .padding()
                    
                    VStack {
                        HStack {
                            Text("내용")
                                .font(.headline)
                                .bold()
                                .foregroundStyle(Color.white)
                            Spacer()
                        }
                        
                        TextEditor(text: $content)
                            .frame(height: 500)
                    }
                    .padding()
                    Spacer()
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
}
