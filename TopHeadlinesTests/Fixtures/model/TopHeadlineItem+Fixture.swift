//
//  TopHeadlineItem+Fixture.swift
//  TopHeadlinesTests
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation
@testable import TopHeadlines

extension TopHeadlineItem {
    static func fixture(
        title: String = "a title",
        author: String? = "an author",
        url: URL = URL(string: "https://headline-url.com")!,
        imageURL: URL? = URL(string: "https://a-url.com")!
    ) -> TopHeadlineItem {
        
        TopHeadlineItem(
            title: title,
            author: author,
            url: url,
            imageURL: imageURL)
    }
}
