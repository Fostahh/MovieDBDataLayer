//
//  NetworkError.swift
//  MovieDBDataLayer
//
//  Created by Mohammad Azri Khairuddin on 26/06/26.
//

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case unacceptableStatusCode(Int)
    case decodingFailed(Error)
    case requestFailed(Error)
    
    public var errorMessage: String {
        switch self {
        case .invalidURL:
            "URL Given is Invalid. Please recheck the BASE_URL given to the Info.plist"
        case .invalidResponse:
            "Response given by server is Invalid"
        case .unacceptableStatusCode(let int):
            "Error with Status Code: \(int)"
        case .decodingFailed(let error):
            "Decoding process failed with Error \(error)"
        case .requestFailed(let error):
            "Request failed with Error \(error)"
        }
    }
}

extension NetworkError: Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL),
             (.invalidResponse, .invalidResponse):
            return true
        case let (.unacceptableStatusCode(l), .unacceptableStatusCode(r)):
            return l == r
        case (.decodingFailed, .decodingFailed),
             (.requestFailed, .requestFailed):
            return true
        default:
            return false
        }
    }
}
