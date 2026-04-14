//
//  SupplementaryListResponse.swift
//  FireLoyaltyKit
//
//  Created by Tao on 14/04/26.
//

import Foundation

public struct SupplementaryListResponse: Codable {
    public let status: String?
    public let customers: [SupplementaryCustomerModel]?
}

public struct SupplementaryCustomerModel: Codable, Identifiable, Equatable, Hashable {
    public var id: String { memberid ?? UUID().uuidString }
    public let custid: String?
    public let memberid: String?
    public let fname: String?
    public let lname: String?
    public let email: String?
    public let phone: String?
    public let dob: String?
    public let points_transferable: Bool?
    public let rewards_transferable: Bool?
    public let relationship: String?
    public let relationship_other: String?
    public let gender: String?
    public let race: String?
    public let address: String?
    public let postcode: String?
    public let city: String?
    public let state: String?
    public let country: String?
    
    init() {
        self.custid = nil
        self.memberid = nil
        self.fname = nil
        self.lname = nil
        self.email = nil
        self.phone = nil
        self.dob = nil
        self.points_transferable = nil
        self.rewards_transferable = nil
        self.relationship = nil
        self.relationship_other = nil
        self.gender = nil
        self.race = nil
        self.address = nil
        self.postcode = nil
        self.city = nil
        self.state = nil
        self.country = nil
    }
    
    init(memberid: String, custid: String, fname: String, lname: String, email: String, phone: String, dob: String, points_transferable: Bool, rewards_transferable: Bool, relationship: String, relationship_other: String, gender: String, race: String, address: String, postcode: String, city: String, state: String, country: String) {
        self.memberid = memberid
        self.custid = custid
        self.fname = fname
        self.lname = lname
        self.email = email
        self.phone = phone
        self.dob = dob
        self.points_transferable = points_transferable
        self.rewards_transferable = rewards_transferable
        self.relationship = relationship
        self.relationship_other = relationship_other
        self.gender = gender
        self.race = race
        self.address = address
        self.postcode = postcode
        self.city = city
        self.state = state
        self.country = country
    }
}

public struct AddSupplementaryResponse: Codable {
    public let status: String?
    public let message: String?
    public let custid: String?
    public let promo: Bool?
    public let member_id: String?
}
