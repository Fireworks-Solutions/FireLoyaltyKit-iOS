//
//  PrivilegesDashboardResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 11/05/26.
//

import Foundation

// MARK: - DashboardResponse
public struct PrivilegesDashboardResponse: Codable {
    public let gotProfile: String?
    public let profile: ProfileResult?
    public let status: String?
    public let message: String?
    public let custname: String?
    public let payPointsEnabled: Bool?
    public let custType: String?
    public let points: String?
    public let tenants: [Tenant]?
    public let news: [Promotion]?
    public let magazines: [Promotion]?
    public let membersNews: [MemberNews]?
    public let bannerNews: [BannerNews]?
    public let promotions: [Promotion]?
    public let rewards: [DashboardReward]?
    public let hotDeals: [DashboardReward]?
    public let events: [Event]?
    public let showDailyCheckIn: Bool?
    

    private enum CodingKeys: String, CodingKey {
        case gotProfile   = "got_profile"
        case status, custname , message ,magazines,profile
        case payPointsEnabled = "paypointsenabled"
        case custType     = "cust_type"
        case points, tenants, news
        case membersNews  = "members_news"
        case bannerNews   = "banner_news"
        case promotions, rewards
        case hotDeals     = "hot_deals"
        case events
        case showDailyCheckIn  = "showDailyCheckIn"
    }
}
