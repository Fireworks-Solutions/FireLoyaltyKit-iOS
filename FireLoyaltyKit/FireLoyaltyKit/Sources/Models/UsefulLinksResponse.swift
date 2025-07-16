//
//  UsefulLinksResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 06/07/25.
//


import Foundation

public struct UsefulLinksResponse: Codable {
    public let status: String?
    public let message: String?
    public let urls: [UsefulLinkItem]
}

public struct UsefulLinkItem: Codable, Identifiable {
    public let id = UUID()
    public let icon: String?
    public let title: String?
    public let url: String?
    
    enum CodingKeys: String, CodingKey {
        case icon, title, url
    }
}
