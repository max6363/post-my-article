//
//  ProfileManager.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import Foundation

final class ProfileManager {
    private init() {}

    private(set) static var selectedProfile: ProfileModel?

    static func saveSelectedProfile(_ profile: ProfileModel) {
        selectedProfile = profile
    }
}
