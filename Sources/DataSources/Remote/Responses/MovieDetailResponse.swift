//
//  MovieDetailResponse.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 25/06/26.
//

import Foundation

struct MovieDetailResponse: Decodable {
    let id: Int?
    let title: String?
    let overview: String?
    let backdropPath: String?
    let posterPath: String?
    let releaseDate: String?
    let runtime: Int?
    let voteAverage: Double?
    let voteCount: Int?
    let tagline: String?
    let genres: [GenreResponse]?

    enum CodingKeys: String, CodingKey {
        case id, title, overview, runtime, tagline, genres
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
