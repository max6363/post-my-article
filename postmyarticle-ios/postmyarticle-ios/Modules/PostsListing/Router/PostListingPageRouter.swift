//
//  PostListingRouter.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import UIKit

final class PostListingRouter: PostListingPageRouterable {
    private weak var navigation: PostListingPageViewable?
    
    init(navigation: PostListingPageViewable? = nil) {
        self.navigation = navigation
    }
    
    func navigateToCreatePostPage(profiles: [ProfileModel]?) {
        let vc = CreatePostBuilder(profiles: profiles).build()
        navigation?.present(vc, animated: true, completion: {
            guard
                let first = profiles?.first(where: { $0.authorId == ProfileManager.selectedProfile?.authorId })
            else { return }
            vc.updateProfileSelection(profile: first)
        })
//        navigation?.navigationController?.pushViewController(vc, animated: true)
    }
}
