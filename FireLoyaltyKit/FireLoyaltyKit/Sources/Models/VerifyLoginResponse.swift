//
//  VerifyLoginResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 09/09/25.
//

import Foundation

public struct VerifyLoginResponse: Codable {
    public let status: String?
    public let message: String?
    public let custid : Int?
    public let action : String?
}
