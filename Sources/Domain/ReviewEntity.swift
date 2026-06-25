//
//  ReviewEntity.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 25/06/26.
//

import Foundation

public struct ReviewEntity: Codable {
    public let id: String?
    public let author: String?
    public let content: String?
    public let rating: Double?
    public let createdAt: String?
    public let avatarPath: String?
}

public struct ReviewPageEntity: Codable {
    public let reviews: [ReviewEntity]
    public let page: Int
    public let totalPages: Int
    public let totalResults: Int
}
