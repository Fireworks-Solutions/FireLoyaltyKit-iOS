//
//  RewardDetailsResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//


import Foundation

/// Top-level response for reward details
public struct RewardDetailsResponse: Codable {
    public let custname: String?
    public let details: [RewardDetail]?
    public let status: String?
    public let message: String?
}

/// Individual reward detail entry
public struct RewardDetail: Codable, Identifiable {
    public var images: [String]?
    public var label: String?
        public var id: String? // used for Identifiable
        public var wallet_id: String?
        public var title: String?
        public var description: String?
        public var featured_image: String?
        
        public var validity: String?
        public var validity_days: String?
        public var validity_message: String?
        public var points: String?
        public var point: String?
        public var points_raw: Int?
        public var purchase_start: String?
        public var purchase_end: String?
        public var tnc : String?
        public var participant_outlet_count : Int?
        public var redeem_start: String?
        public var redeem_end: String?
        public var button_status: Bool?
        public var merchantid: Int?
        
        public var branches_available: Int?
        public var gift_status: String?
        public var redeem_location: String?
        public var share_link: String?
        public var more_details: String?
        
        public var address: String?
        public var latitude: String?
        public var longitude: String?
        public var purchase_quantity: String?
        public var limit_message: String?
        public var purchase_limit: String?
        public var merchant_name: String?
        
        public var mall: Int?
        public var mall_String: String?
        public var gift: Bool?
        public var pickup: Bool?
        public var delivery: Bool?
        public var merchant_info: [MerchantInfo]?
        public var collection_method: [CollectionMethod]?
        public var is_swipe: Bool?
        
        public var purchase_amount: String?
        public var is_donation: Bool?
        
        public var rewards_given: [GivenRewardsModel]?
        public var is_rsvp: Bool?
    
        public let ins_title : String?
        public let ins_desc : String?
        public let is_third_party : Bool?
        public let third_party_redirect : String?
        public let validity_info : ValidityInfo?
        public let is_premium: Bool?
        public let has_dob: Bool?
        // Conform to Identifiable
        public var identity: String? { id }
        public var uuid: UUID { UUID() }
}

/// Collection method option
public struct CollectionMethod: Codable {
    public let id: Int?
    public let shipping: Bool?
    public let title: String?
}

/// Merchant information entry
public struct MerchantInfo: Codable {
    public let id: Int?
    public let mall: String?
    public let title: String?
}

public struct GivenRewardsModel : Codable {
    public let name : String?
    public let type : String?
}
