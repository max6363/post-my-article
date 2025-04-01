//
//  CreatePostReducer.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

final class CreatePostReducer {
    func handle(state: CreatePostState, action: CreatePostAction) -> CreatePostState {
        switch action {
        case .profileSelected(let profile):
            state.flowState = .profileSelected(profile: profile)
        case .submit:
            state.flowState = .submit
        case .pageBack:
            break
        case let .saveText(text):
            state.flowState = .saveText(text: text)
        case let .saveImage(image):
            state.flowState = .saveImage(image: image)
        }
        return state
    }
}
