//
//  MovieEntity.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

import Foundation

public struct MovieEntity: Sendable {
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
    
    public init(
        adult: Bool?,
        backdropPath: String?,
        genreIDS: [Int]?,
        id: Int?,
        title: String?,
        originalLanguage: String?,
        originalTitle: String?,
        overview: String?,
        popularity: Double?,
        posterPath: String?,
        releaseDate: String?,
        softcore: Bool?,
        video: Bool?,
        voteAverage: Double?,
        voteCount: Int?
    ) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
        self.id = id
        self.title = title
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.softcore = softcore
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
