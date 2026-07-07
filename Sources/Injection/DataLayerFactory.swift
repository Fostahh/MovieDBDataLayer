//
//  DataLayerFactory.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

public enum DataLayerFactory {
    public static func makeRepository(authToken: String, baseURL: String) -> MovieRepository {
        let environment = NetworkEnvironmentImpl(url: baseURL, authToken: authToken)
        let networkManager = NetworkManagerImpl(networkEnvironment: environment)
        let remoteDataSource = RemoteDataSourceImpl(networkManager: networkManager)
        return MovieRepositoryImpl(remoteDataSource: remoteDataSource)
    }
}

protocol NetworkEnvironment: Sendable {
    var url: String { get }
    var authToken: String { get }
}

struct NetworkEnvironmentImpl: NetworkEnvironment {
    let url: String
    let authToken: String
}
