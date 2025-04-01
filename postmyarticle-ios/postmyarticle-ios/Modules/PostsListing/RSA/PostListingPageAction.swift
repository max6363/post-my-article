//
//  PostListingPageAction.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import Foundation

enum PostFilter {
    case all
    case myPosts
}

enum PostListingPageAction {
    case fetchItems
    case fetchItemsInitiated
    case itemsLoaded(PostListingPageModel)
    case receivedError(error: Error)
    case profileSelected(profile: ProfileModel)
    case selectPostsFilter(filter: PostFilter)
    case reloadData
    case onCreateNewPostClick
}
