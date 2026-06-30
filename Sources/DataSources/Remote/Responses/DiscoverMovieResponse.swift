//
//  MoviesResponse.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

import Foundation

struct DiscoverMovieResponse: Decodable {
    let page: Int?
    let totalPages: Int?
    let results: [MovieResponse]?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
    }
}

struct MovieResponse: Decodable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let title, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate: String?
    let softcore, video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case softcore, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
