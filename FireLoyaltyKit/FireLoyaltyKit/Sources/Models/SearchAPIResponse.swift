//
//  SearchAPIResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 08/10/25.
//

import Foundation
/*
 {
   "status": "success",
   "message": "Search results retrieved successfully",
   "searchterm": "uni",
   "keyword": "UNIQLO",
   "vouchers": [
     {
       "id": "236",
       "name": "Uniqlo Perfect Gift, Get RM10 OFF",
       "type": "voucher"
     }
   ],
   "merchants": [
     {
       "id": "536",
       "name": "UNIQLO",
       "type": "merchant"
     },
     {
       "id": "541",
       "name": "McDonald's",
       "type": "merchant"
     },
     {
       "id": "543",
       "name": "New Balance",
       "type": "merchant"
     }
   ]
 }
 */
public struct SearchAPIResponse: Codable {
    public let status: String?
    public let message: String?
    public let searchterm: String?
    public let keyword: String?
    
    public let vouchers: [SearchResultItem]?
    public let merchants: [SearchResultItem]?
    
}

public struct SearchResultItem: Codable, Identifiable {
    public let id: String?
    public let name: String?
    public let type: String?
}

