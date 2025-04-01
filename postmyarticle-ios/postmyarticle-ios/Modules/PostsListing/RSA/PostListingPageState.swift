//
//  PostListingPageState.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

enum PostListingPageFlowState {
    case none
    case initiateFetch
    case fetchInitiated
    case fetchFailed(Error)
    case itemsLoaded
    case profileSelected(profile: ProfileModel)
    case postsFilterSelected(filter: PostFilter)
    case reloadData
}

final class PostListingPageState {
    var flowState: PostListingPageFlowState = .none
    var pageResponse: PostListingPageModel?
    var currentFilter: PostFilter = .myPosts
    
    init(pageResponse: PostListingPageModel? = nil) {
        self.pageResponse = pageResponse
    }
}

//extension PostListingPageState {
//    func posts(withAuthor authorId: String) -> [PostModel]? {
//        pageResponse?.items?.filter({ $0.authorId == authorId })
//    }
//    
//    func allPosts() -> [PostModel]? {
//        pageResponse?.items
//    }
//}
