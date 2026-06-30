//
//  Repository.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

public protocol MovieRepository {
    func getMovies(page: Int, genreId: Int?) async throws -> MoviePageEntity
    func getGenres() async throws -> [GenreEntity]
    func getMovieDetail(movieId: Int) async throws -> MovieDetailEntity
    func getReviews(movieId: Int, page: Int) async throws -> ReviewPageEntity
}

final class MovieRepositoryImpl: MovieRepository {
    private let remoteDataSource: RemoteDataSource

    init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func getMovies(page: Int, genreId: Int?) async throws -> MoviePageEntity {
        try await DataMapper.mapDiscoverMovieResponseToMovieEntity(
            response: remoteDataSource.fetchDiscoverMovies(page: page, genreId: genreId)
        )
    }

    func getGenres() async throws -> [GenreEntity] {
        try await DataMapper.mapGenreResponseToGenreEntity(
            response: remoteDataSource.fetchGenres()
        )
    }

    func getMovieDetail(movieId: Int) async throws -> MovieDetailEntity {
        try await DataMapper.mapMovieDetailResponseToMovieDetailEntity(
            response: remoteDataSource.fetchMovieDetail(movieId: movieId)
        )
    }

    func getReviews(movieId: Int, page: Int) async throws -> ReviewPageEntity {
        try await DataMapper.mapReviewListResponseToReviewPageEntity(
            response: remoteDataSource.fetchReviews(movieId: movieId, page: page)
        )
    }
}
