//
//  PostListingPagePresentable.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

protocol PostListingPagePresentable {
    var interactor: PostListingPageInteractable { get set }
    var router: PostListingPageRouterable { get set }
    var view: PostListingPageViewable? { get set }
    
    func getItems() -> [PostModel]?
    func getProfiles() -> [ProfileModel]?
    func handle(action: PostListingPageAction)
}

protocol PostListingPresenterDelegate: AnyObject {
    func handleStateChange(_ state: PostListingPageState)
}
