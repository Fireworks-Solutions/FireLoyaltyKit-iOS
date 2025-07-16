//
//  RewardsListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//
import Foundation
// MARK: - SummaryResponse
public struct RewardsListResponse: Codable {
    public let custname: String?
    public let end: Int?
    public let location: [Location]?
    public let points: Int?
    public let rewards: [RewardListModel]?
    public let starts: Int?
    public let status: String?
    public let message : String?
    public let total: Int?
}

// MARK: - Location
public struct Location: Codable ,Identifiable{
    
    public let location_id: Int?
    public let location_name: String?
    
    public var id: Int? { location_id }
}

// MARK: - RewardItem
public struct RewardListModel: Codable ,Identifiable{
    public let bookmark_status: Int?
    public let buy_to: String?
    public let cash: String?
    public let cash_payment: Int?
    public let category: Int?
    public let description: String?
    public let end_date_text: String?
    public let id: Int?
    public let img: String?
    public let is_donation: Int?
    public let label: String?
    public let label_info: LabelInfo?
    public let mall: Int?
    public let mall_name: String?
    public let name: String?
    public let point: String?
    public let points_raw: Int?
    public let quantity: String?
    public let redeem_loc: Int?
}

