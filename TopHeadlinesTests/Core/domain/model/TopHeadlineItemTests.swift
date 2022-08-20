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
        _ = TopHeadlineItem.fixture()
    }

    func test_init_shouldSetTitle() {
        let testTitle = "Test title"

        let item = TopHeadlineItem.fixture(title: testTitle)

        XCTAssertEqual(item.title, "Test title", "initializer should set the item title")
    }

    func test_init_shouldSetAuthor() {
        let testAuthor = "Test author"

        let item = TopHeadlineItem.fixture(author: testAuthor)

        XCTAssertEqual(item.author, "Test author", "initializer should set the item author")
    }

    func test_init_shouldSetImageURL() {
        let testImageURL = "https://a-test-url.com"
        
        let item = TopHeadlineItem.fixture(imageURL: testImageURL)

        XCTAssertEqual(item.imageURL, "https://a-test-url.com", "initializer should set the item image url")
    }
}
