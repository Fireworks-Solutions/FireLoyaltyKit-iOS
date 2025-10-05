//
//  THdetailsResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 23/07/25.
//
import Foundation
import SwiftUI

public struct THdetailsResponse: Codable, Identifiable {
    public var id: String { code ?? UUID().uuidString }

    public let cash_spent: String?
    public let code: String?
    public let custid: String?
    public let custname: String?
    public let date: String?
    public let name: String?
    public let point_spent: String?
    public let points: String?
    public let img: String?
    public let date2: String?
    public let timestamp: Int?
    public let status: String?
    public let appeal: String?
    public let type: String?
    public let reason: String?
    public let remarks: String?
    public let purchase_value: String?
    public let products: [ProductsList]?
    public let mall: Int?
    public let points_release: Bool?
    public let receipt_no: String?
    public let points_label: String?
    public let mall_image: String?
    public let barcode: String?
    public let trans: String?
    public let staff: String?
    public let staff_id: String?
    public let total: [ProductsList]?
    public let tender_type: [ProductsList]?
    public let internalStaff: StaffInfo?
    public let posted_date: String?
    public let total_savings: String?
    public let number_of_items: Int?
    public let is_refund: Bool?
    public let refund_ref_no: String?
    public let action_type: String?
    public let transaction_type: String?
    public let total_transaction: String?
    public let message: String?
    
}


public struct ProductsList: Codable, Identifiable {
    public let id: String?
    public let name: String?
    public let qty: Int?
    public let price: String?

}

public struct StaffInfo: Codable, Identifiable {
    public var id: String { staffId ?? UUID().uuidString }

    public let staffId: String?
    public let TotalexceptionAmount: String?
    public let staffname: String?
    public let totalPrivilegeAmount: String?
}
