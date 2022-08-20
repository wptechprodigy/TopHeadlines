//
//  TopHeadlinesRequest.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import Foundation

struct TopHeadlinesRequest: RequestProtocol {
    var path: String {
        return "/v2/top-headlines"
    }

    var urlParams: [String : String?] {
        return [
            "country": "us",
            "apiKey": APIConstants.apiKey
        ]
    }

    var requestType: RequestType {
        .GET
    }
}
