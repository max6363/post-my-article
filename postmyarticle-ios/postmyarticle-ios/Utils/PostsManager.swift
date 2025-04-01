//
//  PostsManager.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

final class PostsManager {
    private init() {}

    private(set) static var newPosts: [PostModel] = []

    static func save(post: PostModel) {
        newPosts.append(post)
    }
}
