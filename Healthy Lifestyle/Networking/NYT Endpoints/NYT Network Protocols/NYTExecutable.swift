//
//  NYTExecutable.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/13/21.
//

import Foundation

struct NYTAPIConstant {
    static let apiKey = "tll3FdJtVIbk1snPkGcF5ZffNP2ktLhy"
}

/// NYT Exectuable endpoints protocol with default get request
protocol NYTExecutable: Executable {}
extension NYTExecutable {
    var scheme: String {
        return "https"
    }

    var baseURL: String {
        return "api.nytimes.com"
    }

    var relativePath: String {
        return ""
    }

    var queryItems: [URLQueryItem]? {
        return [URLQueryItem(name: "api-key", value: NYTAPIConstant.apiKey)]
    }

    var body: JSON? {
        return nil
    }

    var header: HTTPHeader? {
        return nil
    }

    var method: HTTPMethod {
        return .GET
    }
}
