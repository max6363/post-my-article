//
//  CreatePostAction.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import UIKit

enum CreatePostAction {
    case profileSelected(profile: ProfileModel)
    case submit
    case pageBack
    case saveText(_ text: String)
    case saveImage(_ image: UIImage)
}
