//
//  NotificationListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 23/07/25.
//

import SwiftUI


public struct NotificationListResponse : Codable {
    
    public let status: String?
    public let message: String?
    public let privateUnreadCount: Int?
    public let globalUnreadCount: Int?
    public let privateInbox: [NotificationListModel]?
    public let globalInbox: [NotificationListModel]?

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case privateUnreadCount = "private_inbox_unread"
        case globalUnreadCount = "global_inbox_unread"
        case privateInbox = "private_inbox"
        case globalInbox = "global_inbox"
    }
}

public struct NotificationListModel: Codable, Identifiable {
    public let id: Int?
    public let title: String?
    public let image: String?
    public let created_at: String?
    public let message: String?
    public let unread: Int?
    public let date: String?
}

