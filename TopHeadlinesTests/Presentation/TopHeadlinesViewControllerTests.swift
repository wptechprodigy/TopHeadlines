//
//  TopHeadlinesViewControllerTests.swift
//  TopHeadlinesTests
//
//  Created by waheedCodes on 19/08/2022.
//

import XCTest
@testable import TopHeadlines

class TopHeadlinesViewControllerTests: XCTestCase {

    func test_canInit() throws {
        _ = try makeSUT()
    }

    func test_viewDidLoad_setsTitle() throws {
        let sut = try makeSUT()

        sut.loadViewIfNeeded()

        XCTAssertEqual(sut.title, "Top Headlines")
    }

    // MARK: - Helpers

    func makeSUT() throws -> TopHeadlinesViewController {
        let bundle = Bundle(for: TopHeadlinesViewController.self)
        let sb = UIStoryboard(name: "Main", bundle: bundle)

        let initialVC = sb.instantiateInitialViewController()
        let sut = try XCTUnwrap(initialVC as? TopHeadlinesViewController)
        return sut
    }
}
