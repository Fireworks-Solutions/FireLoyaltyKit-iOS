//
//  MerchantListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 19/07/25.
//

import Foundation

public struct MerchantListResponse: Codable {
    public let status: String?
    public let message: String?
    public let results: [MerchantListModel]?
}
/*
 var id : String?
 var title : String?
 var siteurl : String?
 var featured_img : String?
 var featured_icon : String?
 var categories : String?
 var floor : String?
 var floor_title: String?
 var unit_no: String?
 var floor_unit: String?
 var isVerifiedMerchant: String?
 */

public struct MerchantListModel: Codable, Identifiable {
    public let id: String?
    public let title: String?
    public let siteurl: String?
    public let featured_img: String?
    public let featured_icon: String?
    public let categories: String?
    public let floor: String?
    public let floor_title: String?
    public let unit_no: String?
    public let floor_unit: String?
    public let isVerifiedMerchant: String?
}
