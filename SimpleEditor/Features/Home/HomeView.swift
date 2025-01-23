import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let store: StoreOf<HomeFeature>
    @State private var moveToSetting: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button("+") {
                        store.send(.addNumber)
                    }
                    Button("-") {
                        store.send(.minusNumber)
                    }
                }
                
                Text("store Number: \(store.number)")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Spacer()
                        CustomButton(image: "gearshape.fill", color: .primaryColor) {
                            moveToSetting = true
                        }
                        CustomButton(image: "plus", color: .primaryColor) {
                            // MARK: TODO - 현재 갤러리 화면 Present
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $moveToSetting) {
                SettingView()
            }
        }
        .background(Color.primaryBackgroundColor)
    }
}
