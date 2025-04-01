//
//  CreatePostPresenter.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import Foundation

final class CreatePostPresenter: CreatePostPresentable {
    var interactor: any CreatePostInteractable
    var router: any CreatePostRouterable
    weak var view: (any CreatePostViewable)?
    
    init(interactor: any CreatePostInteractable, router: any CreatePostRouterable) {
        self.interactor = interactor
        self.router = router
    }
    
    func getProfiles() -> [ProfileModel]? {
        interactor.getProfiles()
    }
    
    func handle(action: CreatePostAction) {
        switch action {
        case .pageBack:
            router.handlePageBack()
            return
        default:
            break
        }
        interactor.handle(action: action)
    }
}

extension CreatePostPresenter: CreatePostPresenterDelegate {
    func handleStateChange(_ state: CreatePostState) {
        switch state.flowState {
        case let .profileSelected(profile):
            view?.updateProfileSelection(profile: profile)
        case .submit:
            router.dismiss()
            notifyNewPostCreationEvent()
        default:
            break
        }
    }
    
    private func notifyNewPostCreationEvent() {
        NotificationCenter.default.post(name: .OnNewPostCreated, object: nil)
    }
}

extension NSNotification.Name {
    static let OnNewPostCreated = Notification.Name("OnNewPostCreated")
}
