//
//  EcomLoginResponse.swift
//  FireLoyaltyKit
//

import Foundation

/// Response of `api/ecom-login.php` (T-Marketplace login).
/// On `status == "success"` the `token` is the marketplace token.
public struct EcomLoginResponse: Codable {
    public let status: String?
    public let message: String?
    public let token: String?
}
