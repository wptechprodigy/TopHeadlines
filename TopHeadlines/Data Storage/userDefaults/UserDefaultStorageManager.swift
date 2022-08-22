//
//  UserDefaultStorageManager.swift
//  TopHeadlines
//
//  Created by waheedCodes on 22/08/2022.
//

import Foundation

struct UserDefaultStorageManager: DataStorageProtocol {

    // MARK: - Error

    enum StorageError: Error {
        case noAvailableData
    }

    // MARK: - Unique key

    let key: String
    private let userDefaults: UserDefaults
    private let parser: DataParserProtocol

    // MARK: - Initializer

    init(
        key: String,
        userDefaults: UserDefaults = .standard,
        parser: DataParserProtocol = DataParser()
    ) {
        self.key = key
        self.userDefaults = userDefaults
        self.parser = parser
    }

    // MARK: - Storing data

    func save(_ value: Data) {
        userDefaults.set(value, forKey: key)
    }

    func retrieve<T: Decodable>() async throws -> T {
        guard let data = userDefaults.data(forKey: key) else {
            throw StorageError.noAvailableData
        }

        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
