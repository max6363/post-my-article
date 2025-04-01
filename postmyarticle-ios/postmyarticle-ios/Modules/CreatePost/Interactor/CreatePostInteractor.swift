//
//  CreatePostInteractor.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import Foundation

final class CreatePostInteractor: CreatePostInteractable {
    weak var presenterDelegate: (any CreatePostPresenterDelegate)?
    var reducer: CreatePostReducer
    var state: CreatePostState
    
    init(reducer: CreatePostReducer, state: CreatePostState) {
        self.reducer = reducer
        self.state = state
    }
    
    func getProfiles() -> [ProfileModel]? {
        state.profiles
    }
    
    func handle(action: CreatePostAction) {
        state = reducer.handle(state: state, action: action)
        handleState(state: state)
    }
    
    private func handleState(state: CreatePostState) {
        switch state.flowState {
        case .submit:
            createPostLocally()
        case let .profileSelected(profile):
            ProfileManager.saveSelectedProfile(profile)
        case let .saveText(text):
            state.postContent?.setText(text)
        case let .saveImage(image):
            state.postContent?.setImage(image)
        default:
            break
        }
        presenterDelegate?.handleStateChange(state)
    }
    
    private func createPostLocally() {
        guard let text = state.postContent?.text else {
            fatalError("Can not create post - post content is not available")
        }
        guard let author = ProfileManager.selectedProfile else { return }
        let post = PostModel(
            postId: UUID().uuidString,
            authorId: author.authorId,
            authorDisplayName: author.displayName,
            authorUsername: author.displayName,
            authorThumbnail: author.profileThumbnail,
            description: text,
            datePosted: Date(),
            image: state.postContent?.image
        )
        PostsManager.save(post: post)
    }
}
