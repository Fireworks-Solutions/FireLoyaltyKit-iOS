//
//  StoreLocatorResponse.swift
//  FireLoyaltyKit
//
//  Created by Tao on 21/04/26.
//

import Foundation

public struct StoreLocatorFilterResponse: Codable {
    public let status: String?
    public let states: [StoreLocatorStateModel]?
    public let services: [StoreLocatorServiceModel]?
}

public struct StoreLocatorStateModel: Codable, Identifiable {
    public let id: String?
    public let name: String?
}

public struct StoreLocatorServiceModel: Codable, Identifiable {
    public let id: String?
    public let name: String?
    public let icon: String?
}

public struct StoreLocatorResultResponse: Codable {
    public let status: String?
    public let outlets: [StoreLocatorOutletModel]?
}

public struct StoreLocatorOutletModel: Codable, Identifiable {
    public let id: String?
    public let title: String?
    public let address: String?
    public let phone_no: String?
    public let email: String?
    public let mobile_no: String?
    public let latitude: String?
    public let longitude: String?
    public let images: [String]?
}
