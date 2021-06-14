//
//  APIError.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/13/21.
//

import Foundation

enum APIError {
    case invalidURL
    case invalidJSONBody
    case statusCode(Int?)
    case invalidData
    case decode(String)
}

extension APIError: Error {
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidJSONBody:
            return "Invalid JSON Body"
        case .statusCode(let code):
            return "Statud Code: \(code ?? -1)"
        case .invalidData:
            return "Invalid Data Response"
        case .decode(let object):
            return "Failed on Decoding: \(object)"
        }

    }
}

enum HLError: Error {
    case apiNetworkError
}

extension HLError {
    var localizedDescription: String {
        switch self {
        case .apiNetworkError:
            return "Oops, Sorry something went wrong with our network. Please try again later"
        }
    }
}
