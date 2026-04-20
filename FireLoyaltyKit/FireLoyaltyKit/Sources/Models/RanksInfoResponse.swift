//
//  RanksInfoResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 30/09/25.
//


import Foundation


public struct RanksInfoResponse: Codable {
    public let status: String?
    public let message: String?
    public let general: GeneralInfo?
    public let ranks: [Rank]?
}

public struct GeneralInfo: Codable {
    public let title: String?
    public let desc: String?
}

public struct Rank: Codable, Identifiable {
    public let id: Int?
    public let name: String?
    public let image: String?
    public let row_1: String?
    public let row_1_desc: String?
    public let row_2: String?
    public let row_2_desc: String?
    
    public var identity: Int? { id }
    
}

public struct Tier: Codable {
    public let id: String?
    public let name: String?
    public let title: String?
    public let sections: [TierSection]?
    public let card_image: String?
    public let eligibility_info: EligibilityInfo?
}

public struct EligibilityInfo: Codable {
    public let title: String?
    public let description: String?
}

public struct TierSection: Codable {
    public let title: String?
    public let icon: String?
    public let description: String?
}
