//
//  RewardDetailsResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//


import Foundation

/// Top-level response for reward details
public struct RewardDetailsResponse: Decodable {
    public let custname: String?
    public let details: [RewardDetail]?
    public let status: String?
    public let message: String?
}

/// Individual reward detail entry
public struct RewardDetail: Decodable, Identifiable {
    public let address: String?
    public let bookmark_status: Int?
    public let branches_available: Int?
    public let cash_purchase: Int?
    public let collection_method: [CollectionMethod]?
    public let delivery: Int?
    public let description: String?
    public let featured_image: URL?
    public let gift: Int?
    public let id: Int?
    public let is_swipe: Int?
    public let label: String?
    public let limit_message: String?
    public let mall: Int?
    public let merchant_info: [MerchantInfo]?
    public let merchant_name: String?
    public let merchantid: Int?
    public let more_details: String?
    public let pickup: Int?
    public let points: String?
    public let points_raw: Int?
    public let purchase_amount: String?
    public let purchase_end: String?
    public let purchase_limit: Int?
    public let purchase_quantity: Int?
    public let purchase_start: String?
    public let quantity_message: String?
    public let redeem_end: String?
    public let redeem_location: String?
    public let redeem_start: String?
    public let stock_message: String?
    public let stock_status: Int?
    public let title: String?
    public let validity: String?
    public let validity_message: String?

    // Conform to Identifiable
    public var identity: Int? { id }
    public var uuid: UUID { UUID() }
}

/// Collection method option
public struct CollectionMethod: Decodable {
    public let id: Int?
    public let shipping: Int?
    public let title: String?
}

/// Merchant information entry
public struct MerchantInfo: Decodable {
    public let id: Int?
    public let mall: String?
    public let title: String?
}
