//
//  SupportTicketListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 02/10/25.
//

import Foundation

public struct SupportTicketListResponse: Codable {
    public let status: String?
    public let message: String?
    public let types: [SupportTicketTypeModel]?
}

public struct SupportTicketTypeModel: Codable, Identifiable {
    public let id: Int?
    public let name: String?
}
