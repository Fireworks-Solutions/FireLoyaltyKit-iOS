//
//  TransactionHistoryModel.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 23/07/25.
//


import Foundation

public struct TransactionHistoryResponse: Codable {
    public var status: String?
    public var message: String?
    public var result: [THistoryMonthModel]?
}


public struct THistoryMonthModel: Codable, Identifiable {
    public var id: String { month ?? UUID().uuidString }
    public var month: String?
    public var data: [THistoryModel]?
}


public struct THistoryModel: Codable, Identifiable {
    public var id: String
    public var transaction_id: String?
    public var custid: String?
    public var name: String?
    public var date: String?
    public var date2: String?
    public var timestamp: String?
    public var month: String?
    public var year: String?
    public var points: String?
    public var cash_spent: String?
    public var point_spent: String?
    public var custname: String?
    public var type: String?
    public var m_y: String?
    public var status: String?
    public var purchase_value: String?
    public var points_label: String?

}
