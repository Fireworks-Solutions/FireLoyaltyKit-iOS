//
//  TimerRewardResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 18/09/25.
//


import Foundation

public struct TimerRewardResponse: Codable {
    public let status: String?
    public let message: String?
    public let remaining_time: Int?
}

