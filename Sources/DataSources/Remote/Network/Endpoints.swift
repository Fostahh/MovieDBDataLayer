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
        case discover(page: Int)
        
        var path: String {
            switch self {
            case .discover(let page): 
                return "/discover/movie"
            }
        }
        
        var queryParams: [URLQueryItem] {
            switch self {
            case .discover(let page):
                return [
                    URLQueryItem(name: "page", value: String(page))
                ]
            }
        }
    }
}
