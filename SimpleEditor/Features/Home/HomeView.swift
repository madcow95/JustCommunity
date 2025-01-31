import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ScrollView {
                    ForEach(store.feeds, id: \.self) { feed in
                        LazyVStack(spacing: 20) {
                            HStack {
                                HStack {
                                    Image(systemName: "sun.max")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                    VStack(alignment: .leading) {
                                        Text(feed.createUser.nickName)
                                            .font(.subheadline)
                                        Text(feed.createUser.userDesc ?? "")
                                            .font(.caption)
                                    }
                                }
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .tint(.primaryColor)
                                }
                            }
                            .frame(width: geometry.size.width, height: 40)
                            
                            Image("testImg")
                                .resizable()
                                .frame(width: geometry.size.width, height: 500)
                                .scaledToFit()
                            
                            HStack {
                                HStack {
                                    Button {
                                        
                                    } label: {
                                        HStack(spacing: -5) {
                                            Image(systemName: "heart")
                                                .frame(width: 40, height: 40)
                                            Text("\(feed.likeCount)")
                                        }
                                        .tint(.primaryColor)
                                    }
                                    Button {
                                        
                                    } label: {
                                        HStack(spacing: -5) {
                                            Image(systemName: "message.fill")
                                                .frame(width: 40, height: 40)
                                            Text("\(feed.comments.count)")
                                        }
                                        .tint(.primaryColor)
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
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "bookmark")
                                            .tint(.primaryColor)
                                            .frame(width: 40, height: 40)
                                    }
                                }
                            }
//                                .padding(.horizontal, 10)
                            .frame(width: geometry.size.width, height: 40)
                            .padding()
//                            .padding(.bottom, 20)
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(20)
                        }
                    }
                }
                .padding(.bottom, 50)
            }
        }
    }
}
