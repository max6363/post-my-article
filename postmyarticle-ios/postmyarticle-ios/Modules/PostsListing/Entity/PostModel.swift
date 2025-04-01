//
//  PostModel.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import UIKit

struct PostModel: Codable {
    let postId: String
    let authorId: String
    let authorDisplayName: String
    let authorUsername: String
    let authorThumbnail: String
    let description: String
    let datePosted: Date
    let likes: Int
    let comments: Int
    let tags: [String]
    var image: UIImage? = nil
    
    init(
        postId: String,
        authorId: String,
        authorDisplayName: String,
        authorUsername: String,
        authorThumbnail: String,
        description: String,
        datePosted: Date,
        likes: Int = 0,
        comments: Int = 0,
        tags: [String] = [],
        image: UIImage? = nil
    ) {
        self.postId = postId
        self.authorId = authorId
        self.authorDisplayName = authorDisplayName
        self.authorUsername = authorUsername
        self.authorThumbnail = authorThumbnail
        self.description = description
        self.datePosted = datePosted
        self.likes = likes
        self.comments = comments
        self.tags = tags
        self.image = image
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case authorId = "author_id"
        case authorDisplayName = "author_display_name"
        case authorUsername = "author_user_name"
        case authorThumbnail = "author_thumbnail"
        case description
        case datePosted = "date_posted"
        case likes, comments, tags
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.postId = try container.decode(String.self, forKey: .postId)
        self.authorId = try container.decode(String.self, forKey: .authorId)
        self.authorDisplayName = try container.decode(String.self, forKey: .authorDisplayName)
        self.authorUsername = try container.decode(String.self, forKey: .authorUsername)
        self.authorThumbnail = try container.decode(String.self, forKey: .authorThumbnail)
        self.description = try container.decode(String.self, forKey: .description)
        
        // Custom date decoding
        let dateString = try container.decode(String.self, forKey: .datePosted)
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: dateString) else {
            throw DecodingError.dataCorruptedError(forKey: .datePosted, in: container, debugDescription: "Date string does not match format expected by formatter.")
        }
        self.datePosted = date
        
        self.likes = try container.decode(Int.self, forKey: .likes)
        self.comments = try container.decode(Int.self, forKey: .comments)
        self.tags = try container.decode([String].self, forKey: .tags)
    }
}
