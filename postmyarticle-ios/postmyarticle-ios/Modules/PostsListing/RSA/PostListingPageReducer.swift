//
//  PostListingPageReducer.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

final class PostListingPageReducer {
    func handle(state: PostListingPageState, action: PostListingPageAction) -> PostListingPageState {
        switch action {
        case .fetchItems:
            if state.pageResponse != nil {
                state.flowState = .itemsLoaded
                return state
            }
            state.flowState = .initiateFetch
        case .fetchItemsInitiated:
            state.flowState = .fetchInitiated
        case let .itemsLoaded(response):
            state.pageResponse = response
            state.flowState = .itemsLoaded
        case .receivedError(let error):
            state.flowState = .fetchFailed(error)
        case let .profileSelected(profile):
            state.flowState = .profileSelected(profile: profile)
        case let .selectPostsFilter(filter):
            state.flowState = .postsFilterSelected(filter: filter)
        case .reloadData:
            state.flowState = .reloadData
        case .onCreateNewPostClick:
            break
        }
        return state
    }
}
