//
//  ArticleDetailModel.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 07/10/25.
//


import Foundation

public struct ArticleDetailResponse: Codable {
    public let status: String?
    public let message: String?
    public let article: ArticleDetailModel?
}

public struct ArticleDetailModel: Codable, Identifiable {
    public let id: Int?
    public let title: String?
    public let description: String?
    public let date: String?
    public let featured_img: String?
    public let external_link: String?
    public let category_id: Int?
    public let category_name: String?
    
    // Identifiable conformance
    public var identity: Int? { id }
}

