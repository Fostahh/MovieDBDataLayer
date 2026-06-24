//
//  Repository.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

public protocol MovieRepository {
    func getMovies(page: Int, genreId: Int?) async throws -> [MovieEntity]
    func getGenres() async throws -> [GenreEntity]
}

final class MovieRepositoryImpl: MovieRepository {
    private let remoteDataSource: RemoteDataSource

    init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func getMovies(page: Int, genreId: Int?) async throws -> [MovieEntity] {
        try await DataMapper.mapDiscoverMovieResponseToMovieEntity(
            response: remoteDataSource.fetchDiscoverMovies(page: page, genreId: genreId)
        )
    }

    func getGenres() async throws -> [GenreEntity] {
        try await DataMapper.mapGenreResponseToGenreEntity(
            response: remoteDataSource.fetchGenres()
        )
    }
}
