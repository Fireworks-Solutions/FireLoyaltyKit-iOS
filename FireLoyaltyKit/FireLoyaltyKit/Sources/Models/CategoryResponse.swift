//
//  CategoryResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//

import Foundation


/// Response model for category listing
public struct CategoryResponse: Codable {
    public let result: [CategoryModel]?
    public let primary_filter : [CategoryModel]?
    public let sort_by : [CategoryModel]?
    public let rewards_type : [CategoryModel]?
    public let category : [CategoryModel]?
    public let categoryid : [CategoryModel]?
    public let status: String?
    public let message: String?
}

// Alternatively, if you prefer true Identifiable conformance:
 public struct CategoryModel: Codable, Identifiable {
     public let featured_img: String?
     public let image : String?
     public let id: String?
     public let title: String?
     public let name: String?
     public let featured : Bool?
 }
