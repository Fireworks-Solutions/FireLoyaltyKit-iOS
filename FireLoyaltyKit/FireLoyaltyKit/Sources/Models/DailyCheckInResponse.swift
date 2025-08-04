//
//  DailyCheckInResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 21/07/25.
//

import Foundation


public struct DailyCheckInResponse: Codable {
    public var status: String?
    public var message: String?
    public var claimed_today: Bool?
    public var weeks: [CheckInWeeks]?
    public var check_in_history: [CheckInRewardHistory]?
}

public struct CheckInWeeks: Codable {
    public var days: [CheckInDays]?
}

public struct CheckInDays: Codable, Identifiable {
   
    public var day: Int?
    public var day_title: String?
    public var day_checked_in: Bool?
    public var day_reward: String?
    
    public var id: String? { day_title }
}

public struct CheckInDaysSection: Identifiable {
   
    public var title: String?
    public var week: [CheckInDays]?

    public var id: String? { title }
    
    public init(title: String, week: [CheckInDays]?) {
        self.title = title
        self.week = week
    }
}

public struct CheckInRewardHistory: Codable, Identifiable {
    public var id: String?
    public var date: String?
    public var check_in_at: String?
    public var reward: String?
}
