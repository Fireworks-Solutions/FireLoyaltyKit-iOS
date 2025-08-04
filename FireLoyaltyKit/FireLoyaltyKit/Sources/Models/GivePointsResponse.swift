//
//  GivePointsResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 21/07/25.
//

import Foundation

public struct GivePointsResponse: Codable {
    public let status: String?
    public let message: String?
    public let register : String?
    public let completeprofile : String?
    public let points : String?
}
