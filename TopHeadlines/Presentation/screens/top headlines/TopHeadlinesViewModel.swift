//
//  TopHeadlinesViewModel.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation

class TopHeadlinesViewModel {

    private var topHeadlines: [TopHeadlineItem] = []
    private let requestManager: RequestManagerProtocol
    private let country: String
    var onTopHeadlinesLoading: (Bool) -> Void = { _ in }

    init(
        requestManager: RequestManagerProtocol,
        country: String
    ) {
        self.requestManager = requestManager
        self.country = country
    }

    func loadTopHeadlines() async {
        do {
            self.onTopHeadlinesLoading(true)
            let response: TopHeadlinesResponse = try await requestManager
                .perform(
                    TopHeadlinesRequest
                        .getHeadlines(
                            forCountry: country))

            self.topHeadlines = response.articles.map(TopHeadlineItem.init)
            self.onTopHeadlinesLoading(false)
        } catch {
            print(error)
        }

    }

    func numberOfRowsIn(section: Int) -> Int {
        topHeadlines.isEmpty ? 0 : topHeadlines.count
    }

    func cellForRowAt(indexPath: IndexPath) -> TopHeadlineItem {
        topHeadlines[indexPath.row]
    }

    func getHeadlineURL(at indexPath: IndexPath) -> String {
        return "https://www.google.com"
    }
}
