//
//  TopHeadlineItem.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation

class TopHeadlineItem {
    let title: String
    let author: String?
    let url: URL
    let imageURL: URL?

    init(title: String, author: String? = nil, url: URL, imageURL: URL? = nil) {
        self.title = title
        self.author = author
        self.url = url
        self.imageURL = imageURL
    }
}

extension TopHeadlineItem {
    convenience init(topHeadlinesResult: ArticleItem) {
        self.init(
            title: topHeadlinesResult.title,
            author: topHeadlinesResult.author,
            url: topHeadlinesResult.url,
            imageURL: topHeadlinesResult.urlToImage)
    }
}
