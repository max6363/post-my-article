//
//  PostListingPageViewable.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import UIKit

protocol PostListingPageViewable: UIViewController {
    var presenter: PostListingPagePresentable? { get set }
    
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
    func showError(_ error: Error)
    func updateProfileSelection(profile: ProfileModel)
}
