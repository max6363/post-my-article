//
//  PostListingPagePresenter.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import Foundation

final class PostListingPagePresenter: PostListingPagePresentable {
    var interactor: any PostListingPageInteractable
    var router: any PostListingPageRouterable
    weak var view: (any PostListingPageViewable)?
    
    init(
        interactor: any PostListingPageInteractable,
        router: any PostListingPageRouterable
    ) {
        self.interactor = interactor
        self.router = router
        
        addNewPostCreationObserver()
    }
    
    func getItems() -> [PostModel]? {
        interactor.getItems()
    }
    
    func getProfiles() -> [ProfileModel]? {
        interactor.getProfiles()
    }
    
    func handle(action: PostListingPageAction) {
        switch action {
        case .onCreateNewPostClick:
            router.navigateToCreatePostPage(profiles: getProfiles())
            return
        default:
            break
        }
        interactor.handle(action: action)
    }
}

extension PostListingPagePresenter: PostListingPresenterDelegate {
    func handleStateChange(_ state: PostListingPageState) {
        switch state.flowState {
        case .fetchInitiated:
            view?.showLoadingView()
        case let .fetchFailed(error):
            view?.showError(error)
        case .itemsLoaded:
            view?.hideLoadingView()
            view?.reloadData()
        case let .profileSelected(profile):
            view?.updateProfileSelection(profile: profile)
            view?.reloadData()
        case .reloadData:
            view?.reloadData()
        default:
            break
        }
    }
}

extension PostListingPagePresenter {
    private func addNewPostCreationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onNewPostCreated),
            name: .OnNewPostCreated,
            object: nil
        )
    }

    @objc
    private func onNewPostCreated() {
        DispatchQueue.main.async { [weak self] in
            self?.handle(action: .reloadData)
        }
    }
}
