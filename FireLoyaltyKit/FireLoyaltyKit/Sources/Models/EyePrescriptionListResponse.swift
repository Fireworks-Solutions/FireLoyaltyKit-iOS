//
//  EyePrescriptionListResponse.swift
//  FireLoyaltyKit
//
//  Created by Tao on 21/04/26.
//

import Foundation

public struct EyePrescriptionListResponse: Codable {
    public let status: String?
    public let message: String?
    public let list: [EyePrescriptionItem]?
}

public struct EyePrescriptionItem: Codable, Identifiable {
    public let id: String?
    public let custid: String?
    public let name: String?

    public let left_power_range_sphere: String?
    public let right_power_range_sphere: String?
    public let left_power_range_cylinder: String?
    public let right_power_range_cylinder: String?
    public let left_axis: String?
    public let right_axis: String?
    public let left_power_range_add: String?
    public let right_power_range_add: String?
    public let left_PD: String?
    public let right_PD: String?
    public let created_at: String?
    public let updated_at: String?

    public var identity: String? { id }

    public var identityValue: String { id ?? UUID().uuidString }

    public var formattedDate: String {
        // Try to return created_at or updated_at in a friendly format; fallback to raw string
        return created_at ?? updated_at ?? ""
    }

    // Conform to Identifiable
    public var _id: String { id ?? UUID().uuidString }

    enum CodingKeys: String, CodingKey {
        case id, custid, name
        case left_power_range_sphere, right_power_range_sphere
        case left_power_range_cylinder, right_power_range_cylinder
        case left_axis, right_axis
        case left_power_range_add, right_power_range_add
        case left_PD, right_PD
        case created_at, updated_at
    }
}

// Detail response containing a single 'details' object
public struct EyePrescriptionDetailResponse: Codable {
    public let status: String?
    public let message: String?
    public let details: EyePrescriptionItem?
}
