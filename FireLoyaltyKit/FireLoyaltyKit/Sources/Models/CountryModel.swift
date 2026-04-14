//
//  CountryModel.swift
//  FireLoyaltyKit
//
//  Created by Tao on 14/04/26.
//

import Foundation

public struct Country: Codable ,Identifiable, Equatable {
    public var id: String
    let code: String
    let name: String
    let flag: String
    let dial_code: String
    let pattern: String
    let limit: Int
}
