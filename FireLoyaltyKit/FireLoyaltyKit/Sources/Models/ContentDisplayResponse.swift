//
//  ContentDisplayModel.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 04/07/26.
//

import Foundation

// MARK: - ContentDisplayResponse
public struct ContentDisplayResponse: Codable {
    public let data: ContentDisplayData?
    public let message: String?
    public let status: Bool?
    
    public init(data: ContentDisplayData?, message: String?, status: Bool?) {
        self.data = data
        self.message = message
        self.status = status
    }
}

// MARK: - ContentDisplayData
public struct ContentDisplayData: Codable {
    public let promotions: ContentDisplayItem?
    public let news: ContentDisplayItem?
    public let events: ContentDisplayItem?
    
    public init(promotions: ContentDisplayItem?, news: ContentDisplayItem?, events: ContentDisplayItem?) {
        self.promotions = promotions
        self.news = news
        self.events = events
    }
}

// MARK: - ContentDisplayItem
public struct ContentDisplayItem: Codable {
    public let key: String?
    public let title: String?
    public let enabled: Bool?
    public let featuredEnabled: Bool?
    public let featuredLimit: Int?
    public let layout: String?
    public let gridCols: Int?
    public let itemsPerPage: Int?
    
    public init(
        key: String?,
        title: String?,
        enabled: Bool?,
        featuredEnabled: Bool?,
        featuredLimit: Int?,
        layout: String?,
        gridCols: Int?,
        itemsPerPage: Int?
    ) {
        self.key = key
        self.title = title
        self.enabled = enabled
        self.featuredEnabled = featuredEnabled
        self.featuredLimit = featuredLimit
        self.layout = layout
        self.gridCols = gridCols
        self.itemsPerPage = itemsPerPage
    }
    
    private enum CodingKeys: String, CodingKey {
        case key
        case title
        case enabled
        case featuredEnabled = "featured_enabled"
        case featuredLimit = "featured_limit"
        case layout
        case gridCols = "grid_cols"
        case itemsPerPage = "items_per_page"
    }
}
