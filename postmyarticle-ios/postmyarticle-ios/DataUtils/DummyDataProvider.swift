//
//  DummyDataProvider.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import Foundation

enum DataParsingError: Error {
    case fileNotFound
    case errorDecodingJSON
}

final class DummyDataProvider {
    static func loadPostResponseFromJSON() throws -> PostListingPageModel? {
        guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else {
            throw DataParsingError.fileNotFound
        }
        do {
            return try JSONDecoder().decode(PostListingPageModel.self, from: try Data(contentsOf: url))
        } catch {
            throw DataParsingError.errorDecodingJSON
        }
    }
}
