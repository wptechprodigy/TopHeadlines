//
//  TopHeadlineItem.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation

class TopHeadlineItem {
    let title: String
    var author: String?
    let imageURL: URL?

    init(title: String, author: String?, imageURL: URL?) {
        self.title = title
        self.author = author
        self.imageURL = imageURL
    }
}

extension TopHeadlineItem {
    convenience init(topHeadlinesResult: ArticleItem) {
        self.init(
            title: topHeadlinesResult.title,
            author: topHeadlinesResult.author,
            imageURL: topHeadlinesResult.urlToImage)
    }
}
