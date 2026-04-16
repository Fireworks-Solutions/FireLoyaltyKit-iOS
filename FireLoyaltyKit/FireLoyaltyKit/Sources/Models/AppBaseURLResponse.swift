//
//  AppBaseURLResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 04/04/26.
//
import Foundation


public struct AppBaseURLResponse: Codable {
    public let status: String?
    public let message: String?
    public let data: AppBaseURLData?
    public let remote_config_enabled : Bool?
    public let remote_config_intervel : Int?

}

public struct AppBaseURLData: Codable {
    public let base_url: String?
    public let marketplace_base_url: String?
}
