//
//  MyRewardDetailsResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//


import Foundation

/// Top-level response for a user's reward details
public struct MyRewardDetailsResponse: Codable {
    public let custname: String?
    public let details: [MyRewardDetail]?
    public let shared_message: String?
    public let status: String?
}

/// Detailed information for an individual reward
public struct MyRewardDetail: Codable, Identifiable {
    public let bar_code: Bool?
    public let bookmark_status: Int?
    public let branches_available: Int?
    public let button_status: Int?
    public let description: String?
    public let featured_image: String?
    public let gift_status: Int?
    public let id: Int?
    public let is_donation: Bool?
    public var validity_days: String?
    public let mall: Int?
    public let mall_name: String?
    public let time: String?
    public let merchant_info: [MerchantInfo]?
    public let merchant_name: String?
    public let merchantid: Int?
    public let more_details: String?
    public let points: String?
    public let purchase_end: String?
    public let purchase_start: String?
    public let qr_code: Bool?
    public let qrcode: String?
    public let redeem_end: String?
    public let redeem_location: String?
    public let redemption_venue: String?
    public let redeem_start: String?
    public let redeem_status: Int?
    public let redirect_link: String?
    public let share_link: String?
    public let shipping: Bool?
    public let swipe: Bool?
    public let text_code: Bool?
    public let title: String?
    public let type: String?
    public let validity: String?
    public let validity_message: String?
    public let wallet_id: String?
    public let timer : Bool?
    public var tnc : String?
    public let delivery_info: String?
    public let tracking_info: String?
    public let shipping_status: String?
    public let used_msg : String?
    public let participant_outlet_count : Int?
    public let ins_title : String?
    public let ins_desc : String?
    public let is_third_party : Bool?
    public let third_party_redirect : String?
    public let validity_info : ValidityInfo?
    public let is_premium: Bool?
    public var images: [String]?
    public var swipe_to_complete : Bool?
    public let long_description: String?
    public let remarks: String?
    public let rebate_amount: String?
    public let is_rebate: String?
    public let transferable: Bool?
    public let transferred_info: TransferredInfo?
    
}

/*
 "validity_info": {
                 "text_color": "#FF0000",
                 "prefix": "Used",
                 "sufix": "2 days ago"
             },
 */
public struct ValidityInfo: Codable {
    public let text_color: String?
    public let prefix: String?
    public let sufix: String?
    
}
