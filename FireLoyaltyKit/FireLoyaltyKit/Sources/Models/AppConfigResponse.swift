//
//  AppConfigModel.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 04/07/26.
//

import Foundation

// MARK: - AppConfigResponse
public struct AppConfigResponse: Codable {
    public let data: AppConfigModel?
    public let message: String?
    public let status: String?
    
    public init(data: AppConfigModel?, message: String?, status: String?) {
        self.data = data
        self.message = message
        self.status = status
    }
}

// MARK: - AppConfigModel
public struct AppConfigModel: Codable {
    public let id: Int?
    public let appName: String?
    public let description: String?
    public let logo: String?
    public let logoURL: String?
    public let backgroundImage: String?
    public let backgroundImageURL: String?
    public let primaryColor: String?
    public let secondaryColor: String?
    public let textPrimaryColor: String?
    public let textSecondaryColor: String?
    public let fontname: String?
    public let iconTintColor: String?
    public let headerColor: String?
    public let backgroundColor: String?
    
    public init(
        id: Int?,
        appName: String?,
        description: String?,
        logo: String?,
        logoURL: String?,
        backgroundImage: String?,
        backgroundImageURL: String?,
        primaryColor: String?,
        secondaryColor: String?,
        textPrimaryColor: String?,
        textSecondaryColor: String?,
        fontname: String?,
        iconTintColor: String?,
        headerColor: String?,
        backgroundColor: String?
    ) {
        self.id = id
        self.appName = appName
        self.description = description
        self.logo = logo
        self.logoURL = logoURL
        self.backgroundImage = backgroundImage
        self.backgroundImageURL = backgroundImageURL
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.textPrimaryColor = textPrimaryColor
        self.textSecondaryColor = textSecondaryColor
        self.fontname = fontname
        self.iconTintColor = iconTintColor
        self.headerColor = headerColor
        self.backgroundColor = backgroundColor
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case appName = "app_name"
        case description
        case logo
        case logoURL = "logo_url"
        case backgroundImage = "background_image"
        case backgroundImageURL = "background_image_url"
        case primaryColor
        case secondaryColor
        case textPrimaryColor
        case textSecondaryColor
        case fontname
        case iconTintColor
        case headerColor
        case backgroundColor
    }
}
