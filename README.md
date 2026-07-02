The data layer for [MovieDB](https://github.com/Fostahh/MovieDB), extracted as a standalone Swift package. It wraps the [TMDB API](https://developer.themoviedb.org/docs) behind a repository interface: `URLSession`-based networking, `Codable` DTOs, and mapping into domain entities — with no third-party dependencies.

## Tech Stack

| Layer | Technology |
| --- | --- |
| Language | Swift (tools 6.0) |
| Networking | Foundation `URLSession` — zero third-party dependencies |
| Decoding | `Codable` response DTOs |
| Concurrency | Swift Concurrency (`async`/`await`, `Sendable` entities) |
| Tests | Swift Testing |
| Distribution | Swift Package Manager |

## Installation

Add the package in Xcode (**File → Add Package Dependencies…**) or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Fostahh/MovieDBDataLayer", from: "1.2.0")
]
```

## Usage

`DataLayerFactory` is the only entry point — it wires the network stack and returns a `MovieRepository`. All implementations stay internal; consumers see just the protocol, the domain entities, and `NetworkError`.

```swift
import MovieDBDataLayer

let repository = DataLayerFactory.makeRepository(
    authToken: "<TMDB API read access token>",
    baseURL: "https://api.themoviedb.org/3"
)

let moviePage = try await repository.getMovies(page: 1, genreId: 28)
let genres = try await repository.getGenres()
let detail = try await repository.getMovieDetail(movieId: 550)
let reviews = try await repository.getReviews(movieId: 550, page: 1)
```

Failures surface as `NetworkError` (invalid URL/response, unacceptable status code, decoding or request failure), each with a human-readable `errorMessage`.

## API

```swift
public protocol MovieRepository {
    func getMovies(page: Int, genreId: Int?) async throws -> MoviePageEntity
    func getGenres() async throws -> [GenreEntity]
    func getMovieDetail(movieId: Int) async throws -> MovieDetailEntity
    func getReviews(movieId: Int, page: Int) async throws -> ReviewPageEntity
}
```

Domain entities (`MovieEntity`, `MovieDetailEntity`, `GenreEntity`, `ReviewEntity`, and their page wrappers carrying pagination metadata) are plain `Sendable` structs, decoupled from the TMDB response format.

## Architecture

```
MovieRepository ──▶ RemoteDataSource ──▶ NetworkManager ──▶ TMDB API
       │                                      (URLSession)
       ▼
   DataMapper (DTO → domain entity)
```

```
Sources/
├── Injection/       # DataLayerFactory — public entry point
├── DataSources/     # MovieRepository protocol + implementation
│   └── Remote/      # RemoteDataSource, NetworkManager, Endpoints,
│                    # NetworkError, Codable response DTOs
├── Mapper/          # DataMapper: responses → domain entities
└── Domain/          # Public entities
Tests/
└── DataSources/     # MovieRepositoryTest + mocked data source
```

## Testing

Repository behavior is covered by unit tests against a mocked remote data source:

## Requirements

- iOS 15.0+ / macOS 12.0+
- Swift 6.0 toolchain

## Acknowledgements

- Movie data provided by [The Movie Database (TMDB)](https://www.themoviedb.org/). This product uses the TMDB API but is not endorsed or certified by TMDB.
