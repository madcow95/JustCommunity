import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let store: StoreOf<HomeFeature>
    
    var body: some View {
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
    }
}
