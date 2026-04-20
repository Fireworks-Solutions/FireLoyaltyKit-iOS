//
//  MerchantBranchListResponse.swift
//  FireLoyaltyKit
//
//  Created by Tao on 21/04/26.
//

import Foundation

public struct MerchantBranchListResponse: Codable {
    public let status: String?
    public let userid: String?
    public let branch: [MerchantBranch]?
}

public struct MerchantBranch: Codable, Identifiable {
    public let id: String?
    public let code: String?
    public let name: String?
}
