//
//  FacilityListResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 25/05/26.
//

import Foundation

public struct FacilityListResponse: Codable {
    public let status: String?
    public let message: String?
    public let results: [FacilityDetailsModel]?
}
    
