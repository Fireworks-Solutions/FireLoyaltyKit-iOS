//
//  PromotionListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 06/07/25.
//


import Foundation

public struct PromotionListResponse: Codable {
    public let  status: String?
    public let  news: [PromotionDetailModel]?
    public let  featured: [PromotionDetailModel]?
    public let  message: String?
    
    public let starts: Int?
    public let end: Int?
    public let total: Int?
}
