//
//  PromotionDetailResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 06/07/25.
//


import Foundation

public struct PromotionDetailResponse: Codable {
    public let  status: String?
    public let  message: String?
    public let  news: [PromotionDetailModel]?
}

public struct PromotionDetailModel: Codable ,Identifiable{
    public let  id: String?
    public let  title: String?
    public let  description: String?
    public let  featured_img: String?
    public let  link: String?
    public let  start_date: String?
    public let  end_date: String?
    public let  location: String?
    public let  created_at: String?
    public let  mall: Int?
    public let  share_link: String?
}
