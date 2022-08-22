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
    private let dataStore: DataStorageProtocol
    private let country: String

    var onTopHeadlinesLoading: (Bool) -> Void = { _ in }

    init(
        requestManager: RequestManagerProtocol,
        country: String,
        dataStore: DataStorageProtocol
    ) {
        self.requestManager = requestManager
        self.country = country
        self.dataStore = dataStore
    }

    func loadTopHeadlines(_ isAvailableConnection: Bool) async {
        do {
            self.onTopHeadlinesLoading(true)

            var response: TopHeadlinesResponse

            switch isAvailableConnection {
                case true:
                    response = try await requestManager
                        .perform(
                            TopHeadlinesRequest
                                .getHeadlines(
                                    forCountry: country))
                    
                case false:
                    
                    response = try await dataStore.retrieve()
            }

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

    func getHeadlineURL(at indexPath: IndexPath) -> URL {
        return topHeadlines[indexPath.row].url
    }
}
