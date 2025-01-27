import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                ScrollView(.vertical) {
                    VStack {
                        VStack {
                            Image("")
                                .resizable()
                                .frame(width: geometry.size.width - 100, height: geometry.size.height - 300)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .padding()
                        }
                        
                        VStack {
                            HStack {
                                CustomButton(image: "arrow.uturn.left",
                                             color: Color.white) {
                                    print("turn left")
                                }
                                             .disabled(true)
                                CustomButton(image: "arrow.uturn.right",
                                             color: Color.white) {
                                    print("right turn")
                                }
                                             .disabled(true)
                                Spacer()
                                CustomButton(image: "play.fill",
                                             color: Color.white) {
                                    print("play")
                                }
                                             .disabled(true)
                                Spacer()
                                CustomButton(image: "arrow.down.left.and.arrow.up.right.square",
                                             color: Color.white) {
                                    print("full screen")
                                }
                            }
                        }
                        .frame(width: geometry.size.width, height: 80)
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack {
                                Spacer()
                                CustomButton(image: "gearshape.fill",
                                             color: Color.white) {
                                    store.send(.moveToSetting)
                                }
                                CustomButton(image: "plus",
                                             color: Color.white) {
                                    store.send(.showGallery)
                                }
                            }
                        }
                    }
                }
                .sheet(
                    isPresented: $store.isGalleryPresented
                ) {
                    VideoPicker(videoURL: nil)
                }
            } destination: { store in
                SettingView(store: store)
            }
        }
    }
}
