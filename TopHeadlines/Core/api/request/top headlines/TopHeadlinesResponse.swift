//
//  TopHeadlinesResponse.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation

struct TopHeadlinesResponse: Decodable {
    let articles: [ArticleItem]
}

struct ArticleItem: Decodable {
    let author: String
    let title: String
    let urlToImage: URL
}
