import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let store: StoreOf<HomeFeature>
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("store Number: hello world")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Spacer()
                        CustomButton(image: "gearshape.fill", color: .primaryColor) {
                            store.send(.moveToSetting(.setting))
                        }
                        CustomButton(image: "plus", color: .primaryColor) {
                            
                        }
                    }
                }
            }
        }
        .background(Color.primaryBackgroundColor)
    }
}
