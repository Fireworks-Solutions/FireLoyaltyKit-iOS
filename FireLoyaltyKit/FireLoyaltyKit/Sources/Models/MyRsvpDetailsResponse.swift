//
//  MyRsvpDetailsResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//


import Foundation

/// Top-level response for a user's RSVP details
public struct MyRsvpDetailsResponse: Codable {
    public let custname: String?
    public let details: [RsvpDetail]?
    public let shared_message: String?
    public let status: String?
}

/// Detailed information for an individual RSVP
public struct RsvpDetail: Codable, Identifiable {
    public let bar_code: Bool?
    public let button_status: Int?
    public let description: String?
    public let featured_image: String?
    public let full_address: String?
    public let gift_status: Bool?
    public let id: Int?
    public let is_donation: Bool?
    public let latitude: String?
    public let longitude: String?
    public let mall: Int?
    public let mall_name: String?
    public let merchant_name: String?
    public let merchantid: Int?
    public let more_details: String?
    public let points: String?
    public let purchase_end: String?
    public let purchase_start: String?
    public let qr_code: Bool?
    public let qrcode: String?
    public let redeem_end: String?
    public let redeem_start: String?
    public let redeem_status: Int?
    public let redirect_link: String?
    public let share_link: String?
    public let swipe: Bool?
    public let text_code: Bool?
    public let title: String?
    public let type: String?
    public let validity: String?
    public let validity_message: String?
    public let wallet_id: String?
}
