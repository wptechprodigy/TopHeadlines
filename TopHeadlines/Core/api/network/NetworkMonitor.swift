//
//  NetworkMonitor.swift
//  TopHeadlines
//
//  Created by waheedCodes on 22/08/2022.
//

import Foundation
import Network

final class NetworkMonitor {

    // MARK: - Shared instance

    private let monitor = NWPathMonitor()

    var isConnected: (Bool) -> Void = { _ in }

    // MARK: - Start

    func startMonitoring() {
        self.monitor.pathUpdateHandler = { [weak self] path in
            switch path.status == .satisfied {
                case true:
                    self?.isConnected(true)
                case false:
                    self?.isConnected(false)
            }
        }

        let queue = DispatchQueue(label: "NetworkAvailabilityMonitor")
        self.monitor.start(queue: queue)
    }

    // MARK: - Stop

    func stopMonitoring() {
        self.monitor.cancel()
    }
}
