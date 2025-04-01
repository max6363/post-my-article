//
//  PostListingPageModel.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import Foundation

struct PostListingPageModel: Codable {
    let profiles: [ProfileModel]?
    var items: [PostModel]?
    
    enum CodingKeys: String, CodingKey {
        case profiles
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.profiles = try container.decode([ProfileModel].self, forKey: .profiles)
        self.items = try container.decode([PostModel].self, forKey: .items)
    }
}
