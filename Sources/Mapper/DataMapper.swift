//
//  DataMapper.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

enum DataMapper {
    static func mapDiscoverMovieResponseToMovieEntity(response: DiscoverMovieResponse) -> MoviePageEntity {
        let results = (response.results ?? []).map {
            MovieEntity(
                adult: $0.adult,
                backdropPath: $0.backdropPath,
                genreIDS: $0.genreIDS,
                id: $0.id,
                title: $0.title,
                originalLanguage: $0.originalLanguage,
                originalTitle: $0.originalTitle,
                overview: $0.overview,
                popularity: $0.popularity,
                posterPath: $0.posterPath,
                releaseDate: $0.releaseDate,
                softcore: $0.softcore,
                video: $0.video,
                voteAverage: $0.voteAverage,
                voteCount: $0.voteCount
            )
        }
        
        return MoviePageEntity(
            movies: results,
            page: response.page ?? 0,
            totalPages: response.totalPages ?? 0
        )
    }

    static func mapGenreResponseToGenreEntity(response: GenreListResponse) -> [GenreEntity] {
        guard let genres = response.genres else { return [] }

        return genres.map {
            GenreEntity(id: $0.id, name: $0.name)
        }
    }

    static func mapMovieDetailResponseToMovieDetailEntity(response: MovieDetailResponse) -> MovieDetailEntity {
        MovieDetailEntity(
            id: response.id,
            title: response.title,
            overview: response.overview,
            backdropPath: response.backdropPath,
            posterPath: response.posterPath,
            releaseDate: response.releaseDate,
            runtime: response.runtime,
            voteAverage: response.voteAverage,
            voteCount: response.voteCount,
            tagline: response.tagline,
            genres: response.genres?.map { GenreEntity(id: $0.id, name: $0.name) }
        )
    }

    static func mapReviewListResponseToReviewPageEntity(response: ReviewListResponse) -> ReviewPageEntity {
        let reviews = (response.results ?? []).map {
            ReviewEntity(
                id: $0.id,
                author: $0.author,
                content: $0.content,
                rating: $0.authorDetails?.rating,
                createdAt: $0.createdAt,
                avatarPath: $0.authorDetails?.avatarPath
            )
        }

        return ReviewPageEntity(
            reviews: reviews,
            page: response.page ?? 1,
            totalPages: response.totalPages ?? 1,
            totalResults: response.totalResults ?? reviews.count
        )
    }
}
