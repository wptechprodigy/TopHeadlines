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
    let title: String
    let author: String?
    let url: URL
    let urlToImage: URL?
}
