//
//  MembershipCardModel.swift
//  FireLoyaltyKit
//
//  Created by Tao on 14/04/26.
//

import Foundation

public struct MembershipCardModel: Identifiable {
    public let id = UUID()
    public let cardImage: String
    public let tierName: String
    public let tierIconSystemName: String
    public let phone: String
    public let memberName: String
    
    public init(cardImage: String, tierName: String, tierIconSystemName: String, phone: String, memberName: String) {
        self.cardImage = cardImage
        self.tierName = tierName
        self.tierIconSystemName = tierIconSystemName
        self.phone = phone
        self.memberName = memberName
    }
}
