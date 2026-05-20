//
//  OcrResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 20/05/26.
//

import Foundation

public struct OcrResponse: Codable {
    public var status: String?
        public var message: String?
        public var picName: String?
        public var receiptDate: String?
        public var amount: String?
        public var merchant: String?
        public var receiptIds: [String]?
        public var mallId: String?

        public enum CodingKeys: String, CodingKey {
            case status
            case message
            case picName       = "pic_name"
            case receiptDate   = "receipt_date"
            case amount
            case merchant
            case receiptIds    = "receipt_id"
            case mallId        = "mall_ids"
        }
}
