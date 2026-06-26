//
//  GenreResponse.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

import Foundation

struct GenreListResponse: Decodable {
    let genres: [GenreResponse]?
}

struct GenreResponse: Decodable {
    let id: Int?
    let name: String?
}
