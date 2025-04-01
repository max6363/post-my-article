//
//  PostListingPageInteractor.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import Foundation

final class PostListingPageInteractor: PostListingPageInteractable {
    weak var presenterDelegate: (any PostListingPresenterDelegate)?
    var reducer: PostListingPageReducer
    var state: PostListingPageState
    
    init(reducer: PostListingPageReducer, state: PostListingPageState) {
        self.reducer = reducer
        self.state = state
    }
    
    func handle(action: PostListingPageAction) {
        state = reducer.handle(state: state, action: action)
        handleState(state: state)
    }
    
    func getItems() -> [PostModel]? {
        let posts1 = (state.pageResponse?.items ?? []) + PostsManager.newPosts
        let posts = posts1.sorted(by: { $0.datePosted > $1.datePosted })
        switch state.currentFilter {
        case .all:
            return posts
        case .myPosts:
            guard let authorId = ProfileManager.selectedProfile?.authorId else { return nil }
            return posts.filter({ $0.authorId == authorId })
        }
    }
    
    func getProfiles() -> [ProfileModel]? {
        state.pageResponse?.profiles
    }
    
    private func handleState(state: PostListingPageState) {
        switch state.flowState {
        case .initiateFetch:
            handle(action: .fetchItemsInitiated)
            fetchItems()
        case let .profileSelected(profile):
            ProfileManager.saveSelectedProfile(profile)
        case let .postsFilterSelected(filter):
            state.currentFilter = filter
            handle(action: .reloadData)
        default:
            break
        }
        presenterDelegate?.handleStateChange(state)
    }
    
    // MARK: - Helpers
    
    private func fetchItems() {
        /// load response after delay to mock asyn response
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self else { return }

            /// load dummy page data
            self.handle(action: .itemsLoaded(dummyPageModel()))
            
            /// select first profile
            /// it can be driven from Backend to send `is_selected` and clients can update accordingly
            if let first = state.pageResponse?.profiles?.first {
                self.handle(action: .profileSelected(profile: first))
            }
        }
    }
    
    private func dummyPageModel() -> PostListingPageModel {
        guard let response = try? DummyDataProvider.loadPostResponseFromJSON() else {
            fatalError("could not parse the response from json")
        }
        return response
    }
}
