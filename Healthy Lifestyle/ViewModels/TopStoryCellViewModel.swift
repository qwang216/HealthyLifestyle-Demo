//
//  TopStoryCellViewModel.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/14/21.
//

import Foundation

struct TopStoryCellViewModel {
    let title: String
    let author: String
    let publishDate: String
    let abstract: String
    let articleURLString: String
    let imageURLString: String?
    var imageURL: URL? {
        guard let url = imageURLString else { return nil }
        return URL(string: url)
    }
    var formattedPublishedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: publishDate)
        dateFormatter.dateFormat = "MMM d, yyy"
        guard let validDate = date else { return "" }
        return dateFormatter.string(from: validDate)
    }

    init(topstory: TopStory) {
        self.title = topstory.title
        self.author = topstory.byline
        self.publishDate = topstory.publishedDate
        self.abstract = topstory.abstract
        self.articleURLString = topstory.url
        self.imageURLString = topstory.multimedia.first?.url
    }
}
