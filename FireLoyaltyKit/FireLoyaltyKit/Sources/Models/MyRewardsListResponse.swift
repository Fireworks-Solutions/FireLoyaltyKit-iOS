//
//  MyRewardsListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//

import Foundation

/// Top-level response for user rewards list
public struct MyRewardsListResponse: Codable {
    public let custname: String?
    public let end: Int?
    public let points: String?
    public let starts: Int?
    public let status: String?
    public let message : String?
    public let total: Int?
    public let wallet: [MyRewardsListModel]?
}

/// Individual wallet item entry
public struct MyRewardsListModel: Codable ,Identifiable{
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
}
