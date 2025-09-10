//
//  MembersAlertResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 06/07/25.
//


import Foundation

public struct MembersAlertResponse: Codable {
    public let  status: String?
    public let  message: String?
    public let  migration_enabled: Bool?
    public let  refresh_timer_value: Int?
    public let  result: [MembersAlert]?
    public let  in_app_alerts: [MembersAlert]?
}

public struct MembersAlert: Codable ,Identifiable{
    public let  close_type: String?
    public let  content: String?
    public let  id: Int?
    public let  image: String?
    public let  type: String?
    public let  url: String?
    public let  to_be_executed: Bool?
    public let  title: String?
    
}
