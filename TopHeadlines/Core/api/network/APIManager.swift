//
//  APIManager.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation

protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol) async throws -> Data
}

class APIManager: APIManagerProtocol {

    private let urlSession: URLSession
    private let storage: DataStorageProtocol

    init(urlSession: URLSession = .shared,
         storage: DataStorageProtocol) {
        self.urlSession = urlSession
        self.storage = storage
    }

    func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())

        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }

        storage.save(data)
        return data
    }
}
