//
//  DataStorageProtocol.swift
//  TopHeadlines
//
//  Created by waheedCodes on 22/08/2022.
//

import Foundation

protocol DataStorageProtocol {
    func save(_ value: Data)
    func retrieve<T: Decodable>() async throws -> T
}
