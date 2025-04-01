//
//  PostListingPageInteractable.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

protocol PostListingPageInteractable {
    var presenterDelegate: PostListingPresenterDelegate? { get set }
    var reducer: PostListingPageReducer { get }
    func getItems() -> [PostModel]?
    func getProfiles() -> [ProfileModel]?
    func handle(action: PostListingPageAction)
}
