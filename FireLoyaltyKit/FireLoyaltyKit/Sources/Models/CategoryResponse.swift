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
    public let status: String?
    public let message: String?
}

// Alternatively, if you prefer true Identifiable conformance:
 public struct CategoryModel: Codable, Identifiable {
     public let featured_img: String?
     public let id: String?
     public let title: String?
 }

///// Individual category entry
//public struct Category: Decodable, Identifiable {
//    public let featured_img: String?
//    public let id: Int?
//    public let title: String?
//
//    // Conform to Identifiable using `id`
//    public var uuid: UUID { UUID() }
//    public var identity: Int? { id }
//}
