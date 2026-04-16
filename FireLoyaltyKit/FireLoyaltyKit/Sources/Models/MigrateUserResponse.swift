//
//  MigrateUserResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 04/04/26.
//
import Foundation

public struct MigrateUserResponse: Codable {
    public let status: String?
    public let message: String?
    public let name: String?
    public let email: String?
    public let phone: String?
    public let phone_country: String?
    public let points: String?
}
