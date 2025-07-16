//
//  EventCheckOutModel.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//


import Foundation

/// Model for event checkout response
public struct EventCheckOutModel: Codable {
    public let balance: Int?
    public let code: String?
    public let message: String?
    public let points_spent: Int?
    public let redemption_id: Int?
    public let rsvp_id: Int?
    public let status: String?

    private enum CodingKeys: String, CodingKey {
        case balance, code, message
        case points_spent
        case redemption_id
        case rsvp_id
        case status
    }
}
