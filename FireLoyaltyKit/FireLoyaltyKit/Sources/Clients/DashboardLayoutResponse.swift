//
//  DashboardLayoutResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 06/07/26.
//

import Foundation

// MARK: - DashboardLayoutResponse
public struct DashboardLayoutResponse: Codable {
    public let data: DashboardLayoutData?
    public let message: String?
    public let status: Bool?
    
    public init(data: DashboardLayoutData?, message: String?, status: Bool?) {
        self.data = data
        self.message = message
        self.status = status
    }
}

// MARK: - DashboardLayoutData
public struct DashboardLayoutData: Codable {
    public let sections: [DashboardSection]?
    public let banners: [DashboardBanner]?
    
    public init(sections: [DashboardSection]?, banners: [DashboardBanner]?) {
        self.sections = sections
        self.banners = banners
    }
}

// MARK: - DashboardSection
public struct DashboardSection: Codable {
    public let key: String?
    public let title: String?
    public let type: String?
    public let order: Int?
    public let enabled: Bool?
    public let rows: Int?
    public let cols: Int?
    public let maxItems: Int?
    public let children: [DashboardBanner]?
    public let image: String?
    public let redirectUrl: String?
    
    public init(
        key: String?,
        title: String?,
        type: String?,
        order: Int?,
        enabled: Bool?,
        rows: Int?,
        cols: Int?,
        maxItems: Int?,
        children: [DashboardBanner]?,
        image: String?,
        redirectUrl: String?
    ) {
        self.key = key
        self.title = title
        self.type = type
        self.order = order
        self.enabled = enabled
        self.rows = rows
        self.cols = cols
        self.maxItems = maxItems
        self.children = children
        self.image = image
        self.redirectUrl = redirectUrl
    }
    
    private enum CodingKeys: String, CodingKey {
        case key
        case title
        case type
        case order
        case enabled
        case rows
        case cols
        case maxItems = "max_items"
        case children
        case image
        case redirectUrl = "redirect_url"
    }
}

// MARK: - DashboardBanner
public struct DashboardBanner: Codable {
    public let key: String?
    public let title: String?
    public let type: String?
    public let order: Int?
    public let enabled: Bool?
    public let image: String?
    public let icon: String?
    public let redirectUrl: String?
    
    public init(
        key: String?,
        title: String?,
        type: String?,
        order: Int?,
        enabled: Bool?,
        image: String?,
        icon: String?,
        redirectUrl: String?
    ) {
        self.key = key
        self.title = title
        self.type = type
        self.order = order
        self.enabled = enabled
        self.image = image
        self.icon = icon
        self.redirectUrl = redirectUrl
    }
    
    private enum CodingKeys: String, CodingKey {
        case key
        case title
        case type
        case order
        case enabled
        case image
        case icon
        case redirectUrl = "redirect_url"
    }
}
