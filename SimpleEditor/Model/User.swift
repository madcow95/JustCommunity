import Foundation

struct User: Hashable {
    var id: String
    var userDesc: String?
    var profileImage: URL?
    var nickName: String
    var bookmarks: [Feed]
}
