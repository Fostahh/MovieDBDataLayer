//
//  MovieDetailEntity.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 25/06/26.
//

import Foundation

public struct MovieDetailEntity: Sendable {
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
    
    init(
        id: Int?,
        title: String?,
        overview: String?,
        backdropPath: String?,
        posterPath: String?,
        releaseDate: String?,
        runtime: Int?,
        voteAverage: Double?,
        voteCount: Int?,
        tagline: String?,
        genres: [GenreEntity]?
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.backdropPath = backdropPath
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.runtime = runtime
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.tagline = tagline
        self.genres = genres
    }
}
