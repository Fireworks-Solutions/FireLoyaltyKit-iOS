//
//  ScanReceiptBranchListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 21/05/26.
//

import Foundation

public struct ScanReceiptBranchListResponse: Codable {
    public let status: String?
    public let userid: String?
    public let branch: [ScanReceiptBranch]?
}

public struct ScanReceiptBranch: Codable, Identifiable {
    public let id: Int?
    public let code: String?
    public let name: String?
}
