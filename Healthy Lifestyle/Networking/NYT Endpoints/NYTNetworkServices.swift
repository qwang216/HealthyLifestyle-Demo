//
//  NYTNetworkServices.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/13/21.
//

import Foundation

protocol NYTNetworkServiceable {
    static func getTopStories(category: TopStoryCategory, completion: @escaping ((Result<[TopStory], HLError>)) -> Void)
}

class NYTNetworkService: NYTNetworkServiceable {
    static func getTopStories(category: TopStoryCategory, completion: @escaping ((Result<[TopStory], HLError>)) -> Void) {
        let topStoryEndpoint = GetTopStories(category: category)
        let request = topStoryEndpoint.executeDecodableRequest(objectType: TopStoryData.self, onCompletion: { result in
            switch result {
            case .success(let data):
                completion(.success(data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        })
        request?.resume()
    }
}
