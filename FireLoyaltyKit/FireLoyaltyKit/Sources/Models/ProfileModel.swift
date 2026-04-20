//
//  ProfileModel.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//

import Foundation

// MARK: –– ProfileModel
public struct ProfileModel: Codable {
    public let status: String?
    public let message: String?
    public let profile: ProfileResult?
}

// MARK: –– ProfileResult
public struct ProfileResult: Codable, Identifiable {
    /// Use `custid` as the unique identifier
    public let id: String

    public let customerStatus: String?
    public let name: String?
    public let fname: String?
    public let lname: String?
    public let email: String?
    public let title: String?
    public let nric: String?
    public let displayName: String?
    public let phone: String?
    public let postcode: String?
    public let cardNo: String?
    public let custType: String?
    public let nextRank: String?
    public let hobby: String?
    public let interest: String?
    public let dob: String?
    public let race: String?
    public let gender: String?
    public let qrcode: String?
    public let qrImage: String?
    public let totalReward: String?
    public let totalRewardPurchased: String?
    public let totalEventPurchased: String?
    public let points: String?
    public let expired: String?
    public let voucher: String?
    public let rank: String?
    public let rankImg: String?
    public let gotProfile: String?
    public let profileUrl: String?
    public let nextLevel: String?
    public let percentageNextLevel: Int?
    public let loveAnniversary: String?
    public let nationality: String?
    public let countryOfResidence: String?
    public let phoneCountry: String?
    public let householdIncome: Int?
    public let selectedInterests: String?
    public let memberCard: String?
    public let userType: String?
    public let preferredMall: String?
    public let address1: String?
    public let address2: String?
    public let city: String?
    public let region: String?
    public let cardExpiry: String?
    public let referralCode: String?
    public let referralWebURL: String?
    public let idType: Int?
    public let expiryPoints: String?
    public let purchaseValue: String?
    public let passwordSaved: Bool?
    public let pointExpiryDate: String?
    public let pointExpiryValue: String?
    public let pValue: Int?
    public let formattedPValue: String?
    public let redeemablePoints: String?
    public let showDailyCheckIn: Bool?
    public let payableByPoints: Bool?
    public let showPayButton: Bool?
    public let countdownTimer: Int?
    public let payPointsEnabled: Bool?
    public let pointsExpiry: [PointsExpiryModel]?
    public let phoneVerified: Bool?
    public let phoneVerifiedErrorMessage: String?
    public let preferredOutletId: String?
    public let preferredOutletName: String?
    public let isVerified: String?
    public let isPrincipal: Bool?

    private enum CodingKeys: String, CodingKey {
        case customerStatus    = "customer_status"
        case id                = "custid"
        case name, fname, lname, email, title, nric
        case displayName       = "display_name"
        case phone, postcode
        case cardNo            = "cardno"
        case custType          = "cust_type"
        case nextRank          = "next_rank"
        case hobby, interest, dob, race, gender, qrcode
        case qrImage           = "qrimage"
        case totalReward       = "total_reward"
        case totalRewardPurchased = "total_reward_purchased"
        case totalEventPurchased  = "total_event_purchased"
        case points, expired, voucher, rank
        case rankImg           = "rank_img"
        case gotProfile        = "got_profile"
        case profileUrl        = "profile"
        case nextLevel         = "next_level"
        case percentageNextLevel = "next_level_percentage"
        case loveAnniversary   = "love_anniversary"
        case nationality
        case countryOfResidence = "country_of_residence"
        case phoneCountry      = "phone_country"
        case householdIncome   = "household_income"
        case selectedInterests = "selected_interests"
        case memberCard        = "member_card"
        case userType          = "user_type"
        case preferredMall     = "preferred_mall"
        case address1, address2, city, region
        case cardExpiry        = "card_expiry"
        case referralCode      = "referral_code"
        case referralWebURL    = "referral_web_url"
        case idType            = "id_type"
        case expiryPoints      = "expiry_points"
        case purchaseValue     = "purchase_value"
        case passwordSaved     = "password_saved"
        case pointExpiryDate   = "point_expiry_date"
        case pointExpiryValue  = "point_expiry_value"
        case pValue            = "p_value"
        case formattedPValue   = "formatted_p_value"
        case redeemablePoints  = "redeemable_points"
        case showDailyCheckIn, payableByPoints = "payable_by_points"
        case showPayButton     = "show_pay_button"
        case countdownTimer    = "countdown_timer"
        case payPointsEnabled  = "paypointsenabled"
        case pointsExpiry  = "points_expiry"
        case isPrincipal       = "is_principal"
        case isVerified        = "is_verified"
        case phoneVerified     = "phone_verified"
        case phoneVerifiedErrorMessage = "phone_verified_error_message"
        case preferredOutletId = "preferred_outlet_id"
        case preferredOutletName = "preferred_outlet_name"
    }
}

// MARK: –– ProfileImageModel
public struct ProfileImageModel: Decodable, Identifiable {
    /// We don’t have a numeric ID here, so generate one on decode
    public let id = UUID()

    public let gotProfile: String?
    public let profile: String?
    public let custname: String?
    public let points: String?
    public let setting: GetSettingModel?

    private enum CodingKeys: String, CodingKey {
        case gotProfile = "got_profile"
        case profile, custname, points, setting
    }
}

// MARK: –– Placeholder for GetSettingModel
public struct GetSettingModel: Codable {
    // Define your properties here, e.g.:
    // public let someFlag: Bool?
    // public let anotherSetting: String?
}

/*
 "points_expiry": [
             {
                 "expiry_points": 0,
                 "expiry_text": "pts will expire on",
                 "expiry_date": "Oct 2025",
                 "expiry_content": "0 pts will expire on Oct 2025"
             },
             {
                 "expiry_points": 0,
                 "expiry_text": "pts will expire on",
                 "expiry_date": "Nov 2025",
                 "expiry_content": "0 pts will expire on Nov 2025"
             },
             {
                 "expiry_points": 0,
                 "expiry_text": "pts will expire on",
                 "expiry_date": "Dec 2025",
                 "expiry_content": "0 pts will expire on Dec 2025"
             }
         ],
 */

// MARK: –– PointsExpiryModel
public struct PointsExpiryModel: Codable, Identifiable {
    public let id = UUID()  // Unique identifier for Identifiable conformance
    public let expiryPoints: Int?
    public let expiryText: String?
    public let expiryDate: String?
    public let expiryContent: String?

    private enum CodingKeys: String, CodingKey {
        case expiryPoints = "expiry_points"
        case expiryText   = "expiry_text"
        case expiryDate   = "expiry_date"
        case expiryContent = "expiry_content"
    }
}

