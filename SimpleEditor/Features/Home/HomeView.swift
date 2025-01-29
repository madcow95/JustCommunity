import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                ScrollView {
                    VStack {
                        HStack {
                            HStack {
                                Image(systemName: "sun.max")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                VStack(alignment: .leading) {
                                    Text("닉네임 들어갈 곳")
                                        .font(.subheadline)
                                    Text("뭐 들어갈 거 있나?")
                                        .font(.caption)
                                }
                            }
                            Spacer()
                            CustomButton(image: "ellipsis", color: .primaryColor) {
                                
                            }
                        }
                        .frame(width: geometry.size.width, height: 40)
                        
                        Image("testImg")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width, height: 500)
                        
                        HStack {
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "heart")
                                        .tint(.primaryColor)
                                        .frame(width: 40, height: 40)
                                }
                                Button {
                                    
                                } label: {
                                    Image(systemName: "message.fill")
                                        .tint(.primaryColor)
                                        .frame(width: 40, height: 40)
                                }
                                Button {
                                    
                                } label: {
                                    Image(systemName: "square.and.arrow.up")
                                        .tint(.primaryColor)
                                        .frame(width: 40, height: 40)
                                }
                            }
                            Spacer()
                            HStack {
                                CustomButton(image: "bookmark", color: .primaryColor) {
                                    
                                }
                            }
                        }
                        .padding([.leading, .trailing], 10)
                        .frame(width: geometry.size.width, height: 40)
                    }
                    .navigationTitle("HomeView")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                store.send(.moveToAdd)
                            } label: {
                                Image(systemName: "plus")
                            }
                            .tint(.primaryColor)
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                store.send(.moveToSetting)
                            } label: {
                                Image(systemName: "gearshape.fill")
                            }
                            .tint(.primaryColor)
                        }
                    }
                }
            } destination: { store in
                switch store.case {
                case let .add(store):
                    AddView(store: store)
                case let .setting(store):
                    SettingView(store: store)
                }
            }
        }
    }
}
