//
//  CreatePostState.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import UIKit

enum CreatePostFlowState {
    case none
    case submit
    case profileSelected(profile: ProfileModel)
    case saveText(text: String)
    case saveImage(image: UIImage)
}

struct PostContentToSubmit {
    var text: String?
    var image: UIImage?
    
    mutating func setText(_ text: String) {
        self.text = text
    }
    
    mutating func setImage(_ image: UIImage) {
        self.image = image
    }
}

final class CreatePostState {
    var flowState: CreatePostFlowState = .none
    var postContent: PostContentToSubmit?
    var profiles: [ProfileModel]?
    
    init(postContent: PostContentToSubmit? = PostContentToSubmit(text: nil), profiles: [ProfileModel]? = nil) {
        self.postContent = postContent
        self.profiles = profiles
    }
}
