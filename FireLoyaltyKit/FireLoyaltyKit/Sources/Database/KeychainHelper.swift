//
//  KeychainHelper.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 27/06/25.
//


import Foundation
import Security

/// A helper to store and retrieve small pieces of data securely in the Keychain.
public final class KeychainHelper {
    public static let shared = KeychainHelper()
    private init() {}

    /// Save a string value for a given key.
    /// - Parameters:
    ///   - value: The string value to store.
    ///   - key: A unique key to identify this entry.
    @discardableResult
    public func save(_ value: String, forKey key: String) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ]
        // Delete any existing item
        SecItemDelete(query as CFDictionary)
        // Add new item
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }

    /// Read a string value for a given key.
    /// - Parameter key: The unique key that identifies the entry.
    /// - Returns: The stored string, or nil if not found or on error.
    public func read(_ key: String) -> String? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status == errSecSuccess,
              let data = item as? Data,
              let value = String(data: data, encoding: .utf8)
        else {
            return nil
        }
        return value
    }

    /// Delete a value for a given key.
    /// - Parameter key: The unique key that identifies the entry.
    @discardableResult
public func delete(_ key: String) -> Bool {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess || status == errSecItemNotFound
    }

    /// Update an existing value for a given key.
    /// - Parameters:
    ///   - value: The new string value.
    ///   - key: The unique key of the existing entry.
    @discardableResult
    public func update(_ value: String, forKey key: String) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        let attributes: [CFString: Any] = [
            kSecValueData: data
        ]
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        return status == errSecSuccess
    }

    /// Clear all generic password items stored by this app.
    @discardableResult
    public func clearAll() -> Bool {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword
        ]
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
}
