//
//  ReviewEntity.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 25/06/26.
//

import Foundation

public struct ReviewEntity: Sendable {
    public let id: String?
    public let author: String?
    public let content: String?
    public let rating: Double?
    public let createdAt: String?
    public let avatarPath: String?
    
    init(id: String?, author: String?, content: String?, rating: Double?, createdAt: String?, avatarPath: String?) {
        self.id = id
        self.author = author
        self.content = content
        self.rating = rating
        self.createdAt = createdAt
        self.avatarPath = avatarPath
    }
}

public struct ReviewPageEntity: Sendable {
    public let reviews: [ReviewEntity]
    public let page: Int
    public let totalPages: Int
    public let totalResults: Int
    
    init(reviews: [ReviewEntity], page: Int, totalPages: Int, totalResults: Int) {
        self.reviews = reviews
        self.page = page
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
