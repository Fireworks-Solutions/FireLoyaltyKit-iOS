//
//  EventDetailsResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//


import Foundation

/// Top-level response for event details
public struct EventDetailsResponse: Codable {
    public let custname: String?
    public let details: [EventDetail]?
    public let status: String?
    public let message: String?
}

/// Detailed information for an individual event
public struct EventDetail: Codable, Identifiable {
    public let address: String?
    public let bookmark_status: Int?
    public let description: String?
    public let featured_image: String?
    public let id: String?
    public let is_rsvp: Int?
    public let label: String?
    public let latitude: String?
    public let limit_message: String?
    public let longitude: String?
    public let mall: Int?
    public let merchantid: String?
    public let time : String?
    public let more_details: String?
    public let points: String?
    public let purchase_end: String?
    public let purchase_limit: String?
    public let purchase_start: String?
    public let quantity_message: String?
    public let redeem_end: String?
    public let redeem_start: String?
    public let redeem_status: Int?
    public let share_link: String?
    public let shipping: Bool?
    public let swipe: Bool?
    public let stock_left: Int?
    public let stock_message: String?
    public let stock_status: Int?
    public let title: String?
    public let validity: String?
    public let validity_message: String?
    public let has_dob: Bool?
    public let rewards_given : [GivenRewardsModel]?
}

