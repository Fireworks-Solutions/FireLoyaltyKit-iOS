//
//  RewardPointsDataResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 23/07/25.
//
import SwiftUI

public struct RewardPointsDataResponse: Codable {
    
    public let status: String?
    public let message: String?
    public let referer: String?
    public let referee: String?
    public let share_message: String?

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case referer
        case referee
        case share_message
    }
}
