//
//  Untitled.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//

import Foundation

public struct GeneralResponseModel: Codable {
    public let status: String?
    public let message: String?
    public let logout : String?
    public let logout_message : String?
    public let points : String?
    public let url : String?
}
