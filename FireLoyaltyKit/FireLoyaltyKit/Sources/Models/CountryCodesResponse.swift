//
//  CountryCodesResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 21/07/25.
//

import Foundation

public struct CountryCodesResponse: Codable {
    public let status: String?
    public let message: String?
    public let country_display: [String]?
    public let country_codes: [String]?
}

