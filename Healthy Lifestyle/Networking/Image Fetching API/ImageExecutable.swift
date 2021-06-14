//
//  ImageExecutable.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/14/21.
//

import Foundation

protocol ImageExecutable: Executable {
    var absoluteURLString: String { get set }
}

extension ImageExecutable {
    var url: URL? {
        return URL(string: absoluteURLString)
    }
    var method: HTTPMethod {
        return .GET
    }
    var baseURL: String {
        return ""
    }
    var header: HTTPHeader? {
        return nil
    }
    var scheme: String {
        return ""
    }
    var queryItems: [URLQueryItem]? {
        return nil
    }
    var body: JSON? {
        return nil
    }
}
