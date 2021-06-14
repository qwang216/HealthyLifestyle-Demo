//
//  Executable.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/12/21.
//

import Foundation

protocol Executable: ResponseMapper {
    var relativePath: String { set get }
    var queryItems: [URLQueryItem]? { get }
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var body: JSON? { get }
    var header: HTTPHeader? { get }
    var scheme: String { get }
    var url: URL? { get }
    func executeRequest(queue: DispatchQueue, session: URLSession, completion: @escaping (Result<Data, APIError>) -> Void) -> URLSessionDataTask?
}

extension Executable {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = baseURL
        urlComponents.path = relativePath
        if let items = queryItems {
            urlComponents.queryItems = items
        }
        return urlComponents.url
    }

    @discardableResult
    func executeRequest(queue: DispatchQueue = .main, session: URLSession = .shared, completion: @escaping (Result<Data, APIError>) -> Void) -> URLSessionDataTask? {
        guard let validURL = url else {
            completion(.failure(.invalidURL))
            return nil
        }

        var request = URLRequest(url: validURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header

        if let body = body {
            do {
                let dataBody = try JSONSerialization.data(withJSONObject: body, options: [])
                request.httpBody = dataBody
            }
            catch {
                completion(.failure(.invalidJSONBody))
            }
        }

        return session.dataTask(with: request) { (data, response, err) in
            let resultResponse = self.parseHTTPReponse((data, (response as? HTTPURLResponse), err))
            queue.async {
                completion(resultResponse)
            }
        }
    }
}
