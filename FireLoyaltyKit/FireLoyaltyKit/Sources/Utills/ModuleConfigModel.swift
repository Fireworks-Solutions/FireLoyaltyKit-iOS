//
//  ModuleConfigModel.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 04/07/26.
//

import Foundation

// MARK: - ModuleConfigResponse
public struct ModuleConfigResponse: Codable {
    public let data: ModuleConfigData?
    public let message: String?
    public let status: Bool?
    
    public init(data: ModuleConfigData?, message: String?, status: Bool?) {
        self.data = data
        self.message = message
        self.status = status
    }
}

// MARK: - ModuleConfigData
public struct ModuleConfigData: Codable {
    public let modules: [ModuleItem]?
    public let features: ModuleFeatures?
    
    public init(modules: [ModuleItem]?, features: ModuleFeatures?) {
        self.modules = modules
        self.features = features
    }
}

// MARK: - ModuleItem
public struct ModuleItem: Codable, Identifiable {
    public let id: Int?
    public let title: String?
    public let key: String?
    public let enabled: Bool?
    public let order: Int?
    public let subModules: [SubModuleItem]?
    
    public init(
        id: Int?,
        title: String?,
        key: String?,
        enabled: Bool?,
        order: Int?,
        subModules: [SubModuleItem]?
    ) {
        self.id = id
        self.title = title
        self.key = key
        self.enabled = enabled
        self.order = order
        self.subModules = subModules
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case key
        case enabled
        case order
        case subModules = "sub_modules"
    }
}

// MARK: - SubModuleItem
public struct SubModuleItem: Codable, Identifiable {
    public let id: Int?
    public let title: String?
    public let key: String?
    public let enabled: Bool?
    
    public init(
        id: Int?,
        title: String?,
        key: String?,
        enabled: Bool?
    ) {
        self.id = id
        self.title = title
        self.key = key
        self.enabled = enabled
    }
}

// MARK: - ModuleFeatures
public struct ModuleFeatures: Codable {
    public let profile: Bool?
    public let transactionHistory: Bool?
    public let vouchers: Bool?
    public let rsvp: Bool?
    public let scanReceipt: Bool?
    public let promotions: Bool?
    public let directory: Bool?
    public let support: Bool?
    public let links: Bool?
    public let notifications: Bool?
    public let supplementaryCard: Bool?
    public let gamification: Bool?
    public let dailyCheckIn: Bool?
    public let stampRewards: Bool?
    
    public init(
        profile: Bool?,
        transactionHistory: Bool?,
        vouchers: Bool?,
        rsvp: Bool?,
        scanReceipt: Bool?,
        promotions: Bool?,
        directory: Bool?,
        support: Bool?,
        links: Bool?,
        notifications: Bool?,
        supplementaryCard: Bool?,
        gamification: Bool?,
        dailyCheckIn: Bool?,
        stampRewards: Bool?
    ) {
        self.profile = profile
        self.transactionHistory = transactionHistory
        self.vouchers = vouchers
        self.rsvp = rsvp
        self.scanReceipt = scanReceipt
        self.promotions = promotions
        self.directory = directory
        self.support = support
        self.links = links
        self.notifications = notifications
        self.supplementaryCard = supplementaryCard
        self.gamification = gamification
        self.dailyCheckIn = dailyCheckIn
        self.stampRewards = stampRewards
    }
    
    private enum CodingKeys: String, CodingKey {
        case profile
        case transactionHistory = "transaction_history"
        case vouchers
        case rsvp
        case scanReceipt = "scan_receipt"
        case promotions
        case directory
        case support
        case links
        case notifications
        case supplementaryCard = "supplementary_card"
        case gamification
        case dailyCheckIn = "daily_check_in"
        case stampRewards = "stamp_rewards"
    }
}
