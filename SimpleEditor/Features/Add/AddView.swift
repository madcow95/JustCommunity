import SwiftUI
import ComposableArchitecture

struct AddView: View {
    @Bindable var store: StoreOf<AddFeature>
    let dismiss: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Add View")
                Button {
                    store.send(.setPhotoSheet(isPresented: true))
                } label: {
                    Image(systemName: "photo.fill")
                        .tint(.primaryColor)
                }
                .frame(width: 200, height: 200)
                .padding()
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
            .sheet(isPresented: $store.isPhotoSheetPresented.sending(\.setPhotoSheet)) {
                VideoPickerView()
            }
        }
    }
}
