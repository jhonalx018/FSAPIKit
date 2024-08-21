// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct RewardsV2: Codable {
    public let data: [Datum]
    public let meta: Meta
}

// MARK: - Datum
public struct Datum: Codable {
    public let businessGroupUid, createdAt: String
    public let facebookPageURL: String?
    public let giftCards: [JSONAny]
    public let hours: String?
    public let howToEarn: String
    public let lastVisit: String?
    public let lifetimePoints: Int
    public let logo: String
    public let membershipUid, merchantName: String
    public let picture: String?
    public let points: Int
    public let promotions: [JSONAny]
    public let rewards: [Reward]
    public let url: String?
    public let userUid: String?
    public let vip: String?
    public let visitedBusinesses: [VisitedBusiness]
    public let visits: Int

    public enum CodingKeys: String, CodingKey {
        case businessGroupUid = "business_group_uid"
        case createdAt = "created_at"
        case facebookPageURL = "facebook_page_url"
        case giftCards = "gift_cards"
        case hours
        case howToEarn = "how_to_earn"
        case lastVisit = "last_visit"
        case lifetimePoints = "lifetime_points"
        case logo
        case membershipUid = "membership_uid"
        case merchantName = "merchant_name"
        case picture, points, promotions, rewards, url
        case userUid = "user_uid"
        case vip
        case visitedBusinesses = "visited_businesses"
        case visits
    }
}

// MARK: - Reward
public struct Reward: Codable {
    public let cost: Int
    public let perk: String
    public let perkRules: PerkRules
    public let perkShortname, resourceURI, rewardUid, uid: String
    public let usable: Bool

    public enum CodingKeys: String, CodingKey {
        case cost, perk
        case perkRules = "perk_rules"
        case perkShortname = "perk_shortname"
        case resourceURI = "resource_uri"
        case rewardUid = "reward_uid"
        case uid, usable
    }
}

// MARK: - PerkRules
public struct PerkRules: Codable {
    public let rewardType: RewardType?
    public let targetCount: Int?
    public let targetID: String?
    public let targetScope: TargetScope?
    public let trigger: Trigger?
    public let triggerData: TriggerData?
    public let units: Units?
    public let value: String?

    public enum CodingKeys: String, CodingKey {
        case rewardType = "reward_type"
        case targetCount = "target_count"
        case targetID = "target_id"
        case targetScope = "target_scope"
        case trigger
        case triggerData = "trigger_data"
        case units, value
    }
}

public enum RewardType: String, Codable {
    case entireTicket = "entire_ticket"
    case items = "items"
}

public enum TargetScope: String, Codable {
    case category = "category"
    case empty = ""
    case sku = "sku"
}

public enum Trigger: String, Codable {
    case empty = ""
    case minTicketPrice = "min_ticket_price"
}

// MARK: - TriggerData
public struct TriggerData: Codable {
    public let minTicketPrice: String?

    public enum CodingKeys: String, CodingKey {
        case minTicketPrice = "min_ticket_price"
    }
}

public enum Units: String, Codable {
    case dollars = "dollars"
    case percent = "percent"
}

public enum UserUid: String, Codable {
    case b92Ad39F322F44D8B06B09Cfa815Ac53 = "b92ad39f322f44d8b06b09cfa815ac53"
}

// MARK: - VisitedBusiness
public struct VisitedBusiness: Codable {
    public let addressLine1, addressLine2: String
    public let beaconInstalled: Bool
    public let businessGroupUid, businessUid, city, howToEarn: String
    public let lat, long, name: String
    public let ondeckEnabled: Bool
    public let phone, postalCode: String
    public let state: String?
    public let type: String
    public let url: String

    public enum CodingKeys: String, CodingKey {
        case addressLine1 = "address_line1"
        case addressLine2 = "address_line2"
        case beaconInstalled = "beacon_installed"
        case businessGroupUid = "business_group_uid"
        case businessUid = "business_uid"
        case city
        case howToEarn = "how_to_earn"
        case lat, long, name
        case ondeckEnabled = "ondeck_enabled"
        case phone
        case postalCode = "postal_code"
        case state, type, url
    }
}

public enum State: String, Codable {
    case ca = "CA"
    case tx = "TX"
    case va = "VA"
}

// MARK: - Meta
public struct Meta: Codable {
    let limit: Int
    let next: String?
    let offset: Int
    let previous: JSONNull?
    let totalCount: Int

    public enum CodingKeys: String, CodingKey {
        case limit, next, offset, previous
        case totalCount = "total_count"
    }
}

// MARK: - Encode/decode helpers

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

public class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
