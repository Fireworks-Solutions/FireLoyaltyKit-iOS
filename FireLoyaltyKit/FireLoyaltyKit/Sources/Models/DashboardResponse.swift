//
//  DashboardResponse.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//


import Foundation

// MARK: - DashboardResponse
public struct DashboardResponse: Codable {
    public let gotProfile: String?
//    public let profile: ProfileResult?
    public let status: String?
    public let message: String?
    public let custname: String?
    public let payPointsEnabled: Bool?
    public let custType: String?
    public let points: String?
    public let tenants: [Tenant]?
    public let news: [Promotion]?
    public let magazines: [Promotion]?
    public let membersNews: [MemberNews]?
    public let bannerNews: [BannerNews]?
    public let promotions: [Promotion]?
    public let rewards: [DashboardReward]?
    public let hotDeals: [DashboardReward]?
    public let events: [Event]?
    public let showDailyCheckIn: Bool?
    

    private enum CodingKeys: String, CodingKey {
        case gotProfile   = "got_profile"
        case status, custname , message ,magazines
        case payPointsEnabled = "paypointsenabled"
        case custType     = "cust_type"
        case points, tenants, news
        case membersNews  = "members_news"
        case bannerNews   = "banner_news"
        case promotions, rewards
        case hotDeals     = "hot_deals"
        case events
        case showDailyCheckIn  = "showDailyCheckIn"
    }
}

// MARK: - Tenant
public struct Tenant: Codable ,Identifiable{
    public let id: String
    public let title: String
    public let description: String?
    public let location: String?
    public let featuredImg: String?
    public let logo: String?
    public let createdAt: String?
    public let total_reward : Int?

    private enum CodingKeys: String, CodingKey {
        case id, title, description, location ,total_reward ,logo
        case featuredImg = "featured_img"
        case createdAt   = "created_at"
    }
}

// MARK: - MemberNews
public struct MemberNews: Codable ,Identifiable{
    public let id: String
    public let title: String
    public let description: String?
    public let featuredImg: String?
    public let createdAt: String?
    public let mall: Int?

    private enum CodingKeys: String, CodingKey {
        case id, title, description
        case featuredImg = "featured_img"
        case createdAt   = "created_at"
        case mall
    }
}

// MARK: - BannerNews
public struct BannerNews: Codable ,Identifiable{
    public let id: String
    public let title: String
    public let description: String?
    public let featured_img: String?
    public let created_at: String?
    public let clickable: Bool?
    public let link: String?
    public let open_link: Bool?
    
    public var identity: String? { id }
}

// MARK: - Promotion
public struct Promotion: Codable ,Identifiable{
    public let id: String
    public let title: String
    public let description: String?
    public let featuredImg: String?
    public let createdAt: String?
    public let mall: Int?
    public let startDate: String?
    public let endDate: String?
    public let endDateText: String?
    
    public let content: String?
    public let image: String?
    public let external_link: String?
    public let cat_title: String?

    private enum CodingKeys: String, CodingKey {
        case id, title, description , content , image , external_link , cat_title
        case featuredImg  = "featured_img"
        case createdAt    = "created_at"
        case mall
        case startDate    = "start_date"
        case endDate      = "end_date"
        case endDateText  = "end_date_text"
    }
}


// MARK: - Reward
public struct DashboardReward: Codable ,Identifiable{
    public let id: String
    public let name: String
    public let description: String?
    public let point: String?
    public let img: String?
    public let date: String?
    public let mall: JSONAny?
    public let cashPayment: Bool?
    public let cash: String?
    public let points_raw: Int?
    public let mallName: String?
    public let validity_days: String?
    public let label: String?
    public let labelInfo: LabelInfo?
    public let validity_info : ValidityInfo?

    private enum CodingKeys: String, CodingKey {
        case id, name, description, point, img, date, mall,points_raw,validity_days,validity_info
        case cashPayment  = "cash_payment"
        case cash
        case mallName     = "mall_name"
        case label
        case labelInfo    = "label_info"
    }
}

public struct LabelInfo: Codable {
    public let textColor: String?
    public let bgColor: String?

    private enum CodingKeys: String, CodingKey {
        case textColor = "text_color"
        case bgColor   = "bg_color"
    }
}

// MARK: - Event
public struct Event: Codable ,Identifiable{
    public let id: String
    public let name: String
    public let description: String?
    public let point: String?
    public let img: String?
    public let date: String?
    public let openLink: Bool?
    public let link: String?
    public let mall: Int?

    private enum CodingKeys: String, CodingKey {
        case id, name, description, point, img, date, mall
        case openLink = "open_link"
case link
    }
}

// MARK: - Helper Types for dynamic JSON arrays

public class JSONCodingKey: CodingKey {
    public var stringValue: String
    public var intValue: Int? { nil }
    required public init?(intValue: Int) { return nil }
    required public init?(stringValue: String) { self.stringValue = stringValue }
}

public class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool { true }
    public func hash(into hasher: inout Hasher) { }
    public init() {}
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self,
                DecodingError.Context(codingPath: decoder.codingPath,
                                      debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

public class JSONAny: Codable {
    public let value: Any

    public required init(from decoder: Decoder) throws {
        if let container = try? decoder.singleValueContainer() {
            if let v = try? container.decode(Bool.self) {
                value = v
                return
            }
            if let v = try? container.decode(Int.self) {
                value = v
                return
            }
            if let v = try? container.decode(Double.self) {
                value = v
                return
            }
            if let v = try? container.decode(String.self) {
                value = v
                return
            }
            if container.decodeNil() {
                value = JSONNull()
                return
            }
        }
        if var container = try? decoder.unkeyedContainer() {
            var arr: [Any] = []
            while !container.isAtEnd {
                let item = try container.decode(JSONAny.self)
                arr.append(item.value)
            }
            value = arr
            return
        }
        if let container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            var dict: [String:Any] = [:]
            for key in container.allKeys {
                let v = try container.decode(JSONAny.self, forKey: key)
                dict[key.stringValue] = v.value
            }
            value = dict
            return
        }
        throw DecodingError.typeMismatch(JSONAny.self,
            DecodingError.Context(codingPath: decoder.codingPath,
                                  debugDescription: "Cannot decode JSONAny"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch value {
        case let v as Bool:
            try container.encode(v)
        case let v as Int:
            try container.encode(v)
        case let v as Double:
            try container.encode(v)
        case let v as String:
            try container.encode(v)
        case is JSONNull:
            try container.encodeNil()
        case let v as [Any]:
            var unkeyedContainer = encoder.unkeyedContainer()
            for item in v {
                let wrapped = JSONAnyWrapper(item)
                try unkeyedContainer.encode(wrapped)
            }
        case let v as [String: Any]:
            var keyedContainer = encoder.container(keyedBy: JSONCodingKey.self)
            for (key, val) in v {
                guard let codingKey = JSONCodingKey(stringValue: key) else { continue }
                let wrapped = JSONAnyWrapper(val)
                try keyedContainer.encode(wrapped, forKey: codingKey)
            }
        default:
            try container.encodeNil()
        }
    }
}
/// Private helper to encode `Any` values wrapped inside arrays/dictionaries.
private struct JSONAnyWrapper: Encodable {
    private let value: Any

    init(_ value: Any) {
        self.value = value
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch value {
        case let v as Bool:
            try container.encode(v)
        case let v as Int:
            try container.encode(v)
        case let v as Double:
            try container.encode(v)
        case let v as String:
            try container.encode(v)
        case is JSONNull:
            try container.encodeNil()
        case let v as [Any]:
            var unkeyedContainer = encoder.unkeyedContainer()
            for item in v {
                try unkeyedContainer.encode(JSONAnyWrapper(item))
            }
        case let v as [String: Any]:
            var keyedContainer = encoder.container(keyedBy: JSONCodingKey.self)
            for (key, val) in v {
                guard let codingKey = JSONCodingKey(stringValue: key) else { continue }
                try keyedContainer.encode(JSONAnyWrapper(val), forKey: codingKey)
            }
        default:
            try container.encodeNil()
        }
    }
}

