//
//  MerchantCategoryResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 21/09/25.
//


import Foundation

/// Response model for category listing
public struct MerchantCategoryResponse: Codable {
    public let result: [CategoryModel]?
    public let primary_filter : [CategoryModel]?
    public let sort_by : [CategoryModel]?
    public let state : [CategoryModel]?
    public let category : [CategoryModel]?
    public let categoryid : [CategoryModel]?
    public let status: String?
    public let message: String?
}
