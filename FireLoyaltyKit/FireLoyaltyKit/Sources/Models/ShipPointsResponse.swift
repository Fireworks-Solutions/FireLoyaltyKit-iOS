//
//  ShippointsResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 11/08/25.
//

import Foundation

public struct ShipPointsResponse: Codable {
    public let status: String?
    public let message: String?
    public let points : Int?
    public let url : String?
}
