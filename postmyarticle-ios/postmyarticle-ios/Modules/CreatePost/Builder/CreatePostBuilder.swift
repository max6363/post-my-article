//
//  CreatePostBuilder.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import UIKit

final class CreatePostBuilder {
    private let profiles: [ProfileModel]?
    
    init(profiles: [ProfileModel]? = nil) {
        self.profiles = profiles
    }
    
    func build() -> CreatePostViewController {
        let reducer = CreatePostReducer()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CreatePostViewController") as? CreatePostViewController else {
            fatalError("Could not initalize \(CreatePostViewController.self) from storyboard")
        }
        let interactor = CreatePostInteractor(reducer: reducer, state: CreatePostState(profiles: profiles))
        let presenter = CreatePostPresenter(
            interactor: interactor,
            router: CreatePostRouter(navigation: vc)
        )
        interactor.presenterDelegate = presenter
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
}
