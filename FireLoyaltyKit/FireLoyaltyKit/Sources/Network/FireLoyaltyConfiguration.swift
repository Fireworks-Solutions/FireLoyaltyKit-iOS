//
//  NetBizKitConfiguration.swift
//  DemoFrameWork
//
//  Created by Mani bhushan M on 27/06/25.
//


import Foundation

/// Holds global settings for all NetBizKit network calls.
public struct FireLoyaltyConfiguration {
        public let baseURL: URL
        public var enableDebug: Bool
    
    public init(baseURL: URL,deviceId : String = "",deviceModel : String = "",version : String = "1.0.0",enableDebug: Bool = false) {
            self.baseURL = baseURL
        self.enableDebug = enableDebug
        KeychainHelper.shared.save(deviceId, forKey: KeychainKeys.deviceId)
        KeychainHelper.shared.save(deviceModel, forKey: KeychainKeys.deviceModel)
        KeychainHelper.shared.save(version, forKey: KeychainKeys.appversion)
        
    }
}
