//
//  PostListingPageBuilder.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import UIKit

final class PostListingPageBuilder {
    private let model: PostListingPageModel?
    
    init(model: PostListingPageModel?) {
        self.model = model
    }
    
    func build() -> PostListingPageViewController {
        let reducer = PostListingPageReducer()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PostListingPageViewController") as? PostListingPageViewController else {
            fatalError("Could not initalize \(PostListingPageViewController.self) from storyboard")
        }
        let interactor = PostListingPageInteractor(reducer: reducer, state: PostListingPageState())
        let presenter = PostListingPagePresenter(
            interactor: interactor,
            router: PostListingRouter(navigation: vc)
        )
        interactor.presenterDelegate = presenter
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
}
