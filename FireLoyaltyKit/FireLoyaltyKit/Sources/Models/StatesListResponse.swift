//
//  StatesListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 19/07/25.
//

import Foundation

public struct StatesListResponse: Codable {
    public let status: String?
    public let message: String?
    public let results: [StatesListModel]?
}

public struct StatesListModel: Codable, Identifiable {
    public let id: String?
    public let state: String?
}

