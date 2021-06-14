//
//  APIConfigurable.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/13/21.
//

import Foundation

protocol NYTAPIConfigurable: NYTExecutable, DecodableObject {
    func executeDecodableRequest<T: Decodable>(queue: DispatchQueue, objectType: T.Type, onCompletion: @escaping (Result<T, HLError>) -> Void) -> URLSessionDataTask?
}

extension NYTAPIConfigurable {
    func executeDecodableRequest<T: Decodable>(queue: DispatchQueue = .main, objectType: T.Type, onCompletion: @escaping (Result<T, HLError>) -> Void) -> URLSessionDataTask? {
        return executeRequest { (result) in
            queue.async {
                switch result {
                case .success(let data):
                    let responseResult = Self.decode(objectType, from: data)
                    if case .success(let responseData) = responseResult {
                        onCompletion(.success(responseData))
                    } else {
                        onCompletion(.failure(.apiNetworkError))
                    }
                case .failure(let error):
                    Logger.shared.logError(error)
                    onCompletion(.failure(.apiNetworkError))
                }
            }
        }
    }
}
