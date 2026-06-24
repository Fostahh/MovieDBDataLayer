//
//  RemoteDataSource.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

import Foundation

protocol RemoteDataSource {
    func fetchDiscoverMovies(page: Int) async throws -> DiscoverMovieResponse
}

final class RemoteDataSourceImpl: RemoteDataSource {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchDiscoverMovies(page: Int) async throws -> DiscoverMovieResponse {
        try await networkManager.request(Endpoints.Gets.discover(page: page))
    }
}
