//
//  TopHeadlineItem.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation

struct TopHeadlineItem {
    let title: String
    let author: String
    let imageURL: String

    init(title: String, author: String, imageURL: String) {
        self.title = title
        self.author = author
        self.imageURL = imageURL
    }
}
