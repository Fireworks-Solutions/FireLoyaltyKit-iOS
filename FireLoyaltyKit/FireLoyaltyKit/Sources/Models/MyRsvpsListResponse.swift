//
//  MyRsvpsListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//


import Foundation

/// Top-level response for user's RSVPs list
public struct MyRsvpsListResponse: Codable {
    public let custname: String?
    public let end: Int?
    public let events: [RsvpListModel]?
    public let wallet: [RsvpListModel]?
    //public let points: Int?
    public let starts: Int?
    public let status: String?
    public let total: Int?
}

/// Individual RSVP entry
public struct RsvpListModel: Codable, Identifiable {
    public let cid: Int?
    public let expired_date: String?
    public let id: Int?
    public let img: String?
    public let mall: Int?
    public let merchant_name: String?
    public let name: String?
    public let point: String?
    public let status: String?
    public let type: String?
    public let units: Int?
    public let redeem_status: Int?
    public let gift_status: Int?
    public let purchase_end : String?

    // Identifiable conformance
    public var identity: Int? { id }
}
