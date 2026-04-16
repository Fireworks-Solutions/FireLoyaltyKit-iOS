//
//  EventsListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//


import Foundation

/// Response model for events list
public struct EventsListResponse: Codable {
    public let custname: String?
    public let events: [EventListModel]?
    public let featured_events: [EventListModel]?
    public let location: [Location]?
    public let points: Int?
    public let status: String?
    public let messsage: String?
    
    public let starts: Int?
    public let end: Int?
    public let total: Int?
}

/// Individual event entry
public struct EventListModel: Codable, Identifiable {
    public let bookmark_status: Int?
    public let city: Int?
    public let create_date: String?
    public let date: String?
    public let description: String?
    public let expiry_date: String?
    public let id: Int?
    public let img: String?
    public let is_rsvp: Bool?
    public let label: String?
    public let link: String?
    public let mall: Int?
    public let name: String?
    public let open_link: Bool?
    public let address: String?
    public let point: String?
    public let quantity: String?
}

