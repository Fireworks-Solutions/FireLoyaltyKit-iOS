//
//  SalutationResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 02/10/25.
//

import Foundation


public struct SalutationResponse: Codable {
    public let status: String?
    public let message: String?
    public let results: [Salutation]?
}

public struct Salutation: Codable, Identifiable {
    public let id: Int?
    public let title: String?
}
