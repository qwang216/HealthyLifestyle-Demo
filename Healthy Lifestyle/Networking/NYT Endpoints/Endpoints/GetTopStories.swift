//
//  GetTopStories.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/13/21.
//

import Foundation

enum TopStoryCategory: String {
    case Arts, Automobiles, Books, Business, Fashion, Food,
         Health, Home, Insider, Magazine, Movies,
         Obituaries, Opinion, Politics, Realestate, Science,
         Sports, Sundayreview, Technology, Theater, Travel,
         Upshot, US, World
    case tmagazine = "T-Magazine",
         nyregion = "NYRegion"

}

struct GetTopStories: NYTAPIConfigurable {
    var relativePath: String = "/svc/topstories/v2"
    init(category: TopStoryCategory) {
        relativePath += "/\(category.rawValue).json"
    }
}
