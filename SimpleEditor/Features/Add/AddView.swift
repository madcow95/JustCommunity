import SwiftUI
import ComposableArchitecture

struct AddView: View {
    @Bindable var store: StoreOf<AddFeature>
    
    var body: some View {
        VStack {
            Text("Add View")
            Button {
                store.send(.setSheet(isPresented: true))
            } label: {
                Image(systemName: "photo.fill")
                    .tint(.primaryColor)
            }
            .frame(width: 200, height: 200)
            .padding()
        }
        .sheet(isPresented: $store.isPhotoSheetPresented.sending(\.setSheet)) {
            VideoPickerView()
        }
    }
}
