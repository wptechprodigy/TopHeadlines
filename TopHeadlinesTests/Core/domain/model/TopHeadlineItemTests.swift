//
//  TopHeadlineItemTests.swift
//  TopHeadlinesTests
//
//  Created by waheedCodes on 20/08/2022.
//

import XCTest
@testable import TopHeadlines

class TopHeadlineItemTests: XCTestCase {

    func test_canInit() {
        let title = "a title"
        let anAuthor = "an author"
        _ = TopHeadlineItem(title: title, author: anAuthor)
    }

    func test_init_shouldSetTitle() {
        let title = "a title"
        let anAuthor = "an author"
        let item = TopHeadlineItem(title: title, author: anAuthor)

        XCTAssertEqual(item.title, "a title", "initializer should set the item title")
    }

    func test_init_shouldSetTitleAndAuthor() {
        let title = "a title"
        let anAuthor = "an author"
        let item = TopHeadlineItem(title: title, author: anAuthor)

        XCTAssertEqual(item.author, "an author", "initializer should set the item author")
    }

    // MARK: - Helpers

//    private func makeTopHeadlineItem() -> TopHealineItem {
//
//    }
}
