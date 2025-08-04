//
//  MerchantDetailsResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 19/07/25.
//


import Foundation

public struct MerchantDetailsResponse: Codable {
    public let status: String?
    public let message: String?
    public let merchant_details: MerchantDetailsModel?
   // public let branches: [BranchDetails]?
    public let related_rewards: [DashboardReward]?
    //public let tabs: [Tab]?
}
    
public struct MerchantDetailsModel: Codable {
    public var id: String?
    public var title: String?
    public var description: String?
    public var featured_image: String?
    public var address: String?
    public var contact: String?
    public var weburl: String?
    public var fav_icon: String?
    public var faq: String?
    public var term_conditions: String?
    public var privacy_policy: String?
    public var banner: String?
    public var menu5: String?
    public var menu5_url: String?
    public var facebook_url: String?
    public var instagram_url: String?
    public var youtube_url: String?
    public var google_url: String?
    public var twitter_url: String?
    public var tagline: String?
    public var latitude : String?
    public var longitude : String?
}

//public struct BranchDetails: Codable {
//    public let status: String?
//    public let message: String?
//    public let merchant_details: MerchantDetailsModel?
//    public let branches: [BranchDetails]?
//    public let related_rewards: [DashboardReward]?
//    public let tabs: [Tab]?
//}
