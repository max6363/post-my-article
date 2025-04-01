//
//  CreatePostRouter.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

final class CreatePostRouter: CreatePostRouterable {
    private weak var navigation: CreatePostViewable?
    
    init(navigation: CreatePostViewable? = nil) {
        self.navigation = navigation
    }
    
    func handlePageBack() {
//        self.navigation?.navigationController?.popViewController(animated: true)
//        self.navigation?.dismiss(animated: true)
        dismiss()
    }
    
    func dismiss() {
        self.navigation?.dismiss(animated: true)
    }
}
