//
//  FacilityDetailsResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 25/05/26.
//

import Foundation

public struct FacilityDetailsResponse: Codable {
    public let status: String?
    public let message: String?
    public let facility_details: FacilityDetailsModel?
}
    
public struct FacilityDetailsModel: Codable {
    public var id: String?
    public var title: String?
    public var description: String?
    public var featured_image: String?
    public var featured_icon: String?
    public var floor: String?
    public var floor_unit: String?
    public var floor_name: String?

}
