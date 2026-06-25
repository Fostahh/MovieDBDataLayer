//
//  RemoteDataSource.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

import Foundation

protocol RemoteDataSource {
    func fetchDiscoverMovies(page: Int, genreId: Int?) async throws -> DiscoverMovieResponse
    func fetchGenres() async throws -> GenreListResponse
}

final class RemoteDataSourceImpl: RemoteDataSource {

    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func fetchDiscoverMovies(page: Int, genreId: Int?) async throws -> DiscoverMovieResponse {
        try await networkManager.request(Endpoints.Gets.discover(page: page, genreId: genreId))
    }

    func fetchGenres() async throws -> GenreListResponse {
        try await networkManager.request(Endpoints.Gets.genres)
    }
}
