//
//  MovieRepositoryTest.swift
//  MovieDBDataLayer
//
//  Created by Mohammad Azri Khairuddin on 26/06/26.
//

import Testing
import Foundation
@testable import MovieDBDataLayer

struct MovieRepositoryTests {
    private let remoteDataSourceMock: MockRemoteDataSource
    private let movieRepository: MovieRepository

    init() {
        remoteDataSourceMock = MockRemoteDataSource()
        movieRepository = MovieRepositoryImpl(remoteDataSource: remoteDataSourceMock)
    }

    // MARK: getMovies
    @Test func getMovies_onSuccess_withResultsExist() async throws {
        remoteDataSourceMock.discoverMoviesResult = .success(remoteDataSourceMock.getMockDiscoverMoviResponse())

        let entity = try await movieRepository.getMovies(page: 1, genreId: nil)
        #expect(entity.count == 1)
        #expect(entity.first?.backdropPath == "Backdrop Path")
        #expect(entity.first?.adult == true)
    }
    
    @Test func getMovies_onSuccess_withResultsNil() async throws {
        remoteDataSourceMock.discoverMoviesResult = .success(
            DiscoverMovieResponse(page: 1, results: nil)
        )

        let entity = try await movieRepository.getMovies(page: 1, genreId: nil)
        #expect(entity.isEmpty)
    }

    @Test func getMovies_onFailed_invalidURL() async {
        remoteDataSourceMock.discoverMoviesResult = .failure(NetworkError.invalidURL)
        let thrownError = await #expect(throws: NetworkError.self) {
            try await movieRepository.getMovies(page: 1, genreId: nil)
        }
        #expect(thrownError?.errorMessage == NetworkError.invalidURL.errorMessage)
    }
    
    
    // MARK: - getGenres
    @Test func getGenres_onSuccess_withGenresExist() async throws {
        remoteDataSourceMock.genresResult = .success(remoteDataSourceMock.getMockGenreResponse())
        
        let entity = try await movieRepository.getGenres()
        #expect(entity.count == 1)
        #expect(entity.first?.id == 1)
        #expect(entity.first?.name == "Name")
    }
    
    @Test func getGenres_onSuccess_withGenresNil() async throws {
        remoteDataSourceMock.genresResult = .success(
            GenreListResponse(genres: nil)
        )
        
        let entity = try await movieRepository.getGenres()
        #expect(entity.isEmpty)
    }
    
    @Test func getGenres_onFailed_invalidResponse() async {
        remoteDataSourceMock.genresResult = .failure(NetworkError.invalidResponse)
        let thrownError = await #expect(throws: NetworkError.self) {
            try await movieRepository.getGenres()
        }
        #expect(thrownError?.errorMessage == NetworkError.invalidResponse.errorMessage)
    }
    
    // MARK: - getMovieDetail
    @Test func getMovieDetail_onSuccess_withResponse() async throws {
        remoteDataSourceMock.movieDetailResult = .success(remoteDataSourceMock.getMockMovieDetailResponse())
        
        let entity = try await movieRepository.getMovieDetail(movieId: 1)
        #expect(entity.id == 1)
        #expect(entity.genres?.count == 1)
    }
    
    @Test func getMovieDetail_onFailed_unacceptableStatusCode() async throws {
        remoteDataSourceMock.movieDetailResult = .failure(NetworkError.unacceptableStatusCode(404))
        let thrownError = await #expect(throws: NetworkError.self) {
            try await movieRepository.getMovieDetail(movieId: 1)
        }
        #expect(thrownError?.errorMessage == NetworkError.unacceptableStatusCode(404).errorMessage)
    }
    
    // MARK: - getReviews
    @Test func getReviews_onSuccess_withReviewsExist() async throws {
        remoteDataSourceMock.reviewsResult = .success(remoteDataSourceMock.getMockReviewListResponse())
        
        let entity = try await movieRepository.getReviews(movieId: 1, page: 1)
        #expect(entity.page == 1)
        #expect(entity.reviews.count == 1)
        #expect(entity.reviews.first?.author == "Author")
        #expect(entity.totalResults == entity.reviews.count)
    }
    
    @Test func getReviews_onSuccess_withEmptyReview() async throws {
        remoteDataSourceMock.reviewsResult = .success(
            ReviewListResponse(
                page: nil,
                results: nil,
                totalPages: nil,
                totalResults: nil
            )
        )
        
        let entity = try await movieRepository.getReviews(movieId: 1, page: 1)
        #expect(entity.reviews.isEmpty)
        #expect(entity.page == 1)
        #expect(entity.totalPages == 1)
        #expect(entity.totalResults == entity.reviews.count)
    }
    
    @Test func getReviews_onFailed_nonNetworkError() async throws {
        let error = NSError(domain: "Domain", code: 1)
        remoteDataSourceMock.reviewsResult = .failure(NetworkError.requestFailed(error))
        let thrownError = await #expect(throws: NetworkError.self) {
            try await movieRepository.getReviews(movieId: 1, page: 1)
        }
        
        #expect(thrownError?.errorMessage == NetworkError.requestFailed(error).errorMessage)
    }
}
