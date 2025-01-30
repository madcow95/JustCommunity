import Foundation

struct Feed: Hashable {
    let createUser: User
    var likeCount: Int
    var comments: [Comment]
    var images: [URL]
}

struct Comment: Hashable {
    var createUser: User
    var title: String
    var comment: String
    var likeCount: Int
}
