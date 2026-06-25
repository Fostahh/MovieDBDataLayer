//
//  MovieEntity.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

import Foundation

public struct MovieEntity: Codable {
    public let adult: Bool?
    public let backdropPath: String?
    public let genreIDS: [Int]?
    public let id: Int?
    public let title, originalLanguage, originalTitle, overview: String?
    public let popularity: Double?
    public let posterPath, releaseDate: String?
    public let softcore, video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?
}
