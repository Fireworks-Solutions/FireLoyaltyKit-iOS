//
//  CheckoutApiResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//

import Foundation

/// Model for checkout response
public struct CheckOutModel: Decodable {
    public let balance: String?
    public let code: String?
    public let countdown_timer: Int?
    public let message: String?
    public let points_spent: Int?
    public let redemption_venue: String?
    public let status: String?
    public let title: String?
    public let validity_period: String?
    public let walletid: Int?
    public let wallettype: String?
}
