//
//  RepositoryMocksProvider.swift
//  MovieDBDataLayer
//
//  Created by Mohammad Azri Khairuddin on 26/06/26.
//

@testable import MovieDBDataLayer
import Foundation

class MockRemoteDataSource: RemoteDataSource {
    
    var discoverMoviesResult: Result<DiscoverMovieResponse, Error> = .failure(NSError())
    func fetchDiscoverMovies(page: Int, genreId: Int?) async throws -> DiscoverMovieResponse {
        try discoverMoviesResult.get()
    }
    
    var genresResult: Result<GenreListResponse, Error> = .failure(NSError())
    func fetchGenres() async throws -> GenreListResponse {
        try genresResult.get()
    }
    
    var movieDetailResult: Result<MovieDetailResponse, Error> = .failure(NSError())
    func fetchMovieDetail(movieId: Int) async throws -> MovieDetailResponse {
        try movieDetailResult.get()
    }
    
    var reviewsResult: Result<ReviewListResponse, Error> = .failure(NSError())
    func fetchReviews(movieId: Int, page: Int) async throws -> ReviewListResponse {
        try reviewsResult.get()
    }
    
    // MARK: - Mock Response Provider
    func getMockDiscoverMoviResponse() -> DiscoverMovieResponse {
        DiscoverMovieResponse(
            page: 1,
            results: [MovieResponse(
                adult: true,
                backdropPath: "Backdrop Path",
                genreIDS: nil,
                id: nil,
                title: nil,
                originalLanguage: nil,
                originalTitle: nil,
                overview: nil,
                popularity: nil,
                posterPath: nil,
                releaseDate: nil,
                softcore: nil,
                video: nil,
                voteAverage: nil,
                voteCount: nil
            )]
        )
    }
    
    func getMockGenreResponse() -> GenreListResponse {
        GenreListResponse(genres: [GenreResponse(id: 1, name: "Name")])
    }
    
    func getMockMovieDetailResponse() -> MovieDetailResponse {
        MovieDetailResponse(
            id: 1,
            title: "Title",
            overview: "Overview",
            backdropPath: "Backdrop Path",
            posterPath: "Poster Path",
            releaseDate: "Release Date",
            runtime: nil,
            voteAverage: 8.0,
            voteCount: 1000,
            tagline: nil,
            genres: [GenreResponse(id: 1, name: "Name")]
        )
    }
    
    func getMockReviewListResponse() -> ReviewListResponse {
        let reviews = [ReviewResponse(
            id: "1",
            author: "Author",
            content: "Content",
            createdAt: "Created At",
            authorDetails: AuthorDetailsResponse(rating: 8.0, avatarPath: "Avatar Path")
        )]
        
        return ReviewListResponse(
            page: 1,
            results: reviews,
            totalPages: 10,
            totalResults: reviews.count
        )
    }
}
