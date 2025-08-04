//
//  RegisterResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 21/07/25.
//
import Foundation

public struct RegisterResponse: Codable {
    public let status: String?
    public let message: String?
    public let custid : String?
    public let member_id : String?
    //public let promo : Bool?
    public let referral_code : String?
    
}
