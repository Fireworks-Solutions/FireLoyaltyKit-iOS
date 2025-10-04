//
//  PurchasedCountResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 18/09/25.
//

import Foundation


/// Response model for category listing
public struct PurchasedCountResponse: Codable {
    public let result: PurchasedCountModel?
    public let status: String?
    public let message: String?
}

// Alternatively, if you prefer true Identifiable conformance:
 public struct PurchasedCountModel: Codable {
     public let total_reward: String?
     public let total_reward_purchased : String?
     public let total_event_purchased: String?
 }
