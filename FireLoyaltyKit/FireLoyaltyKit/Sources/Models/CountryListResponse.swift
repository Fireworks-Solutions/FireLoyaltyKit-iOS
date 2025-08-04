//
//  CountryListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 21/07/25.
//

import Foundation

public struct CountryListResponse: Codable {
    public let status: String?
    public let message: String?
    public let results: [StatesListModel]?
}

public struct CountryListModel: Codable, Identifiable {
    public let id: String?
    public let value: String?
    public let label: String?
    public let code: String?
}
