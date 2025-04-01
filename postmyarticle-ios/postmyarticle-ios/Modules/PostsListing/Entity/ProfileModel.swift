//
//  ProfileModel.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import Foundation

struct ProfileModel: Codable {
    let authorId: String
    let displayName: String
    let userName: String
    let profileThumbnail: String
    let bio: String

    enum CodingKeys: String, CodingKey {
        case authorId = "author_id"
        case displayName = "display_name"
        case userName = "user_name"
        case profileThumbnail = "profile_thumbnail"
        case bio
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authorId = try container.decode(String.self, forKey: .authorId)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.profileThumbnail = try container.decode(String.self, forKey: .profileThumbnail)
        self.bio = try container.decode(String.self, forKey: .bio)
    }
}
