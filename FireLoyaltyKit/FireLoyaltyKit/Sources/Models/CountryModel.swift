//
//  CountryModel.swift
//  FireLoyaltyKit
//
//  Created by Tao on 14/04/26.
//

import Foundation

public struct Country: Codable ,Identifiable, Equatable {
    public var id: String
    public let code: String
    public let name: String
    public let flag: String
    public let dial_code: String
    public let pattern: String
    public let limit: Int
}
