//
//  TopStory.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/13/21.
//

import Foundation

struct TopStoryData: Codable {
    let results: [TopStory]
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct TopStory: Codable {
    let title: String
    let abstract: String
    let byline: String
    let publishedDate: String
    let url: String
    let multimedia: [TopStoryMultimedia]

    enum CodingKeys: String, CodingKey {
        case title, abstract, byline,
             url, multimedia
        case publishedDate = "published_date"
    }
}

struct TopStoryMultimedia: Codable {
    let url: String
}
