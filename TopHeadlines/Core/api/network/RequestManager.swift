//
//  RequestManager.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {
    private let apiManager: APIManagerProtocol
    private let parser: DataParserProtocol

    init(
        apiManager: APIManagerProtocol,
        parser: DataParserProtocol
    ) {
        self.apiManager = apiManager
        self.parser = parser
    }

    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
