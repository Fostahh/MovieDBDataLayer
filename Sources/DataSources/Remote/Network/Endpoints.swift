//
//  Endpoints.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var queryParams: [URLQueryItem] { get }
}

enum Endpoints {
    
    enum Gets: Endpoint {
        case discover(page: Int, genreId: Int?)
        case genres
        case movieDetail(movieId: Int)
        case reviews(movieId: Int, page: Int)

        var path: String {
            switch self {
            case .discover:
                return "/discover/movie"
            case .genres:
                return "/genre/movie/list"
            case .movieDetail(let movieId):
                return "/movie/\(movieId)"
            case .reviews(let movieId, _):
                return "/movie/\(movieId)/reviews"
            }
        }

        var queryParams: [URLQueryItem] {
            switch self {
            case let .discover(page, genreId):
                var items = [URLQueryItem(name: "page", value: String(page))]
                if let genreId {
                    items.append(URLQueryItem(name: "with_genres", value: String(genreId)))
                }
                return items
            case .genres:
                return []
            case .movieDetail:
                return []
            case .reviews(_, let page):
                return [URLQueryItem(name: "page", value: String(page))]
            }
        }
    }
}
