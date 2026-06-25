//
//  GenreResponse.swift
//  MovieDB
//
//  Created by Mohammad Azri Khairuddin on 24/06/26.
//

import Foundation

struct GenreListResponse: Codable {
    let genres: [GenreResponse]?
}

struct GenreResponse: Codable {
    let id: Int?
    let name: String?
}
