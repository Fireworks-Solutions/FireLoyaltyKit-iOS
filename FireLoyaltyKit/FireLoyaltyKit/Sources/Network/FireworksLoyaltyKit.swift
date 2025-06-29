//
//  FireLoyaltyKit.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 27/06/25.
//

import Foundation

public struct FireworksLoyaltyKit {
    /// Shared configuration: must be set before any network call.
    public private(set) static var configuration: FireLoyaltyConfiguration?

    /// The shared network client, using the supplied configuration.
    public private(set) static var network: NetworkClient!

    /// Call once—ideally in your AppDelegate or `@main`—to set baseURL/token.
    public static func configure(with config: FireLoyaltyConfiguration) {
        self.configuration = config
        self.network = NetworkClient(configuration: config)
    }

}
