//
//  TopHeadlinesRequest.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation

enum TopHeadlinesRequest: RequestProtocol {
    case getHeadlines(forCountry: String)

    var path: String {
        return "/v2/top-headlines"
    }

    var urlParams: [String : String?] {
        switch self {
            case .getHeadlines(let country):
                return [
                    "country": country,
                    "apiKey": APIConstants.apiKey
                ]
        }
    }

    var requestType: RequestType {
        .GET
    }
}
