//
//  ReviewResponse.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 25/06/26.
//

import Foundation

struct ReviewListResponse: Codable {
    let page: Int?
    let results: [ReviewResponse]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct ReviewResponse: Codable {
    let id: String?
    let author: String?
    let content: String?
    let createdAt: String?
    let authorDetails: AuthorDetailsResponse?

    enum CodingKeys: String, CodingKey {
        case id, author, content
        case createdAt = "created_at"
        case authorDetails = "author_details"
    }
}

struct AuthorDetailsResponse: Codable {
    let rating: Double?
    let avatarPath: String?

    enum CodingKeys: String, CodingKey {
        case rating
        case avatarPath = "avatar_path"
    }
}
