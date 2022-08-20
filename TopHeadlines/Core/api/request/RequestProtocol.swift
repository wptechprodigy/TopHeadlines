//
//  RequestProtocol.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    var urlParams: [String: String?] { get }
    var requestType: RequestType { get }

    func createURLRequest() throws -> URLRequest
}

extension RequestProtocol {

    private var host: String {
        return APIConstants.baseURL
    }

    var urlParams: [String: String?] {
        return [:]
    }

    func createURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path

        if !urlParams.isEmpty {
            urlComponents.queryItems = urlParams.map {
                return URLQueryItem(name: $0, value: $1)
            }
        }

        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return urlRequest
    }
}
