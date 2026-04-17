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

    /// MD5 salt used to generate the `vc` authentication header.
    public let authTokenPass: String
    /// Static secret sent as the `svc` request parameter.
    public let secretKeyPass: String
    /// Salt used to generate the `pvc` hash for customer validation.
    public let pvcSeKey: String
    /// Password required by the delete-account API.
    public let deleteAccountPass: String

    public init(
        baseURL: URL,
        authTokenPass: String,
        secretKeyPass: String,
        pvcSeKey: String,
        deleteAccountPass: String,
        deviceId: String = "",
        deviceModel: String = "",
        deviceType: String = "",
        version: String = "1.0.0",
        buildNumber: String = "",
        lang: String = "en",
        enableDebug: Bool = false
    ) {
        self.baseURL = baseURL
        self.authTokenPass = authTokenPass
        self.secretKeyPass = secretKeyPass
        self.pvcSeKey = pvcSeKey
        self.deleteAccountPass = deleteAccountPass
        self.enableDebug = enableDebug
        KeychainHelper.shared.save(deviceId, forKey: KeychainKeys.deviceId)
        KeychainHelper.shared.save(deviceModel, forKey: KeychainKeys.deviceModel)
        KeychainHelper.shared.save(deviceType, forKey: KeychainKeys.deviceType)
        KeychainHelper.shared.save(version, forKey: KeychainKeys.appversion)
        KeychainHelper.shared.save(buildNumber, forKey: KeychainKeys.buildNumber)
        KeychainHelper.shared.save(lang, forKey: KeychainKeys.lang)
    }
}
