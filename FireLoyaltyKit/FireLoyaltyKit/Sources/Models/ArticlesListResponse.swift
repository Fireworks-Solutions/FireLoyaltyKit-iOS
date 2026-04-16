//
//  ArticlesListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 07/10/25.
//

import Foundation

public struct ArticlesListResponse: Codable {
    public let status: String?
    public let message: String?
    public let article: [ArticleListModel]?
    public let starts: Int?
    public let end: Int?
    public let total: Int?
}

public struct ArticleListModel: Codable, Identifiable {
    public let id: Int?
    public let title: String?
    public let description: String?
    public let date: String?
    public let featured_img: String?
    public let external_link: String?
    public let category_id: Int?
    public let category_name: String?
}
