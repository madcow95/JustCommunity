import Foundation
import ComposableArchitecture

@Reducer
struct HomeFeature {
    
    @ObservableState
    struct State {
        var feeds: [Feed] = (1...20).map { _ in
            Feed(createUser: users.randomElement()!, likeCount: (1...100).randomElement()!, comments: [], images: [])
        }
    }
    
    enum Action {
        case temp
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .temp:
                return .none
            }
        }
    }
}

let user1 = User(id: "1", userDesc: "userDesc1", nickName: "user1", bookmarks: [])
let user2 = User(id: "2", userDesc: "userDesc2", nickName: "user2", bookmarks: [])
let user3 = User(id: "3", userDesc: "userDesc3", nickName: "user3", bookmarks: [])
let user4 = User(id: "4", userDesc: "userDesc4", nickName: "user4", bookmarks: [])
let user5 = User(id: "5", userDesc: "userDesc5", nickName: "user5", bookmarks: [])
let user6 = User(id: "6", userDesc: "userDesc6", nickName: "user6", bookmarks: [])
let user7 = User(id: "7", userDesc: "userDesc7", nickName: "user7", bookmarks: [])
let user8 = User(id: "8", userDesc: "userDesc8", nickName: "user8", bookmarks: [])
let user9 = User(id: "9", userDesc: "userDesc9", nickName: "user9", bookmarks: [])
let user10 = User(id: "10", userDesc: "userDesc10", nickName: "user10", bookmarks: [])
let users = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]
