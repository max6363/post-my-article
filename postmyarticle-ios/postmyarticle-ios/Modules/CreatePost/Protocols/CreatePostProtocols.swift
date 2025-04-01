//
//  CreatePostProtocols.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import UIKit

protocol CreatePostViewable: UIViewController {
    var presenter: CreatePostPresentable? { get set }
    
    func updateProfileSelection(profile: ProfileModel)
}

protocol CreatePostPresentable {
    var interactor: CreatePostInteractable { get set }
    var router: CreatePostRouterable { get set }
    var view: CreatePostViewable? { get set }
    
    func getProfiles() -> [ProfileModel]?
    func handle(action: CreatePostAction)
}

protocol CreatePostPresenterDelegate: AnyObject {
    func handleStateChange(_ state: CreatePostState)
}

protocol CreatePostInteractable {
    var presenterDelegate: CreatePostPresenterDelegate? { get set }
    var reducer: CreatePostReducer { get }
    
    func getProfiles() -> [ProfileModel]?
    func handle(action: CreatePostAction)
}

protocol CreatePostRouterable {
    func handlePageBack()
    func dismiss()
}
