//
//  FloorsListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 25/05/26.
//

import Foundation

public struct FloorsListResponse: Codable {
    public let status: String?
    public let message: String?
    public let results: [FloorListModel]?
}
    
public struct FloorListModel: Codable {
    public let status: String?
    public let message: String?
    public let floor_id: Int?
    public let floor_name: String?
    public let floor_unit: String?
}
