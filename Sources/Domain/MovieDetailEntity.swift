//
//  MovieDetailEntity.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 25/06/26.
//

import Foundation

public struct MovieDetailEntity: Codable {
    public let id: Int?
    public let title: String?
    public let overview: String?
    public let backdropPath: String?
    public let posterPath: String?
    public let releaseDate: String?
    public let runtime: Int?
    public let voteAverage: Double?
    public let voteCount: Int?
    public let tagline: String?
    public let genres: [GenreEntity]?
}
