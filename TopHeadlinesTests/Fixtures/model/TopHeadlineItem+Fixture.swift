//
//  TopHeadlineItem+Fixture.swift
//  TopHeadlinesTests
//
//  Created by waheedCodes on 20/08/2022.
//

@testable import TopHeadlines

extension TopHeadlineItem {
    static func fixture(
        title: String = "a title",
        author: String = "an author"
    ) -> TopHeadlineItem {
        TopHeadlineItem(title: title, author: author)
    }
}
