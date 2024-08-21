// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - PurpleEmbed
public struct PurpleEmbed: Codable {
    let promotions: Welcome
    let rewards: Rewards
    let visitedBusinesses: VisitedBusinesses

    enum CodingKeys: String, CodingKey {
        case promotions, rewards
        case visitedBusinesses = "visited_businesses"
    }
}

// MARK: - PurpleMeta
public struct PurpleMeta: Codable {
    let embed: PurpleEmbed
    let links: FluffyLinks
}

// MARK: - WelcomeItem
public struct WelcomeItem: Codable {
    let businessGroupUid, createdAt: String
    let lastVisit: JSONNull?
    let lifetimePoints: Int
    let meta: PurpleMeta
    let points: Int
    let uid, userUid, vip: String
    let visits: Int

    enum CodingKeys: String, CodingKey {
        case businessGroupUid = "business_group_uid"
        case createdAt = "created_at"
        case lastVisit = "last_visit"
        case lifetimePoints = "lifetime_points"
        case meta, points, uid
        case userUid = "user_uid"
        case vip, visits
    }
}

// MARK: - Welcome
public struct Welcome: Codable {
    let items: [WelcomeItem]
    public let meta: WelcomeMeta
}

// MARK: - Rewards
public struct Rewards: Codable {
    let items: [RewardsItem]
    public let meta: WelcomeMeta
}

// MARK: - RewardsItem
public struct RewardsItem: Codable {
    let meta: FluffyMeta
    let perk: String
    let pointCost: Int
    let uid: String

    enum CodingKeys: String, CodingKey {
        case meta, perk
        case pointCost = "point_cost"
        case uid
    }
}

// MARK: - FluffyMeta
public struct FluffyMeta: Codable {
    public let embed: FluffyEmbed
    let links: PurpleLinks
}

// MARK: - FluffyEmbed
public struct FluffyEmbed: Codable {
}

// MARK: - PurpleLinks
public struct PurpleLinks: Codable {
    let linksSelf: BusinessGroup

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - BusinessGroup
public struct BusinessGroup: Codable {
    let href, type: String
}

// MARK: - WelcomeMeta
public struct WelcomeMeta: Codable {
    public let limit: Int
    let next: String
    let offset: Int
    let previous: JSONNull?
}

// MARK: - VisitedBusinesses
public struct VisitedBusinesses: Codable {
    public let items: [VisitedBusinessesItem]
    public let meta: WelcomeMeta
}

// MARK: - VisitedBusinessesItem
public struct VisitedBusinessesItem: Codable, Identifiable {
    public let id: UUID = UUID()
    
    public let businessGroupUid, businessTypeUid, city: String?
    let ctsEnabled, ctsManyToManyEnabled: Bool?
    public let itemDescription: String?
    let displayLabelNew, facebookPageID, facebookPageURL: JSONNull?
    let fromTheOwner: String?
    let googlePlusURL: JSONNull?
    let hours, howToEarn, instagramHandle: String?
    let isDemo, isFreePlan: Bool?
    let lat: String?
    let logo: String?
    let long: String?
    public let meta: FluffyMeta
    let modifiedAt, name: String?
    let ondeckEnabled: Bool?
    let paymentType, phone: String?
    let picture: String?
    let pointLimit: Int?
    let postalCode: String?
    let rewardDetails: JSONNull?
    let shortname, signupBonus, signupPromotionUid, softwareID: String?
    let state, timeZone, twitterHandle: String?
    let twitterURL: JSONNull?
    let type, uid, url, yelpURL: String?

    enum CodingKeys: String, CodingKey {
        case businessGroupUid = "business_group_uid"
        case businessTypeUid = "business_type_uid"
        case city
        case ctsEnabled = "cts_enabled"
        case ctsManyToManyEnabled = "cts_many_to_many_enabled"
        case itemDescription = "description"
        case displayLabelNew = "display_label_new"
        case facebookPageID = "facebook_page_id"
        case facebookPageURL = "facebook_page_url"
        case fromTheOwner = "from_the_owner"
        case googlePlusURL = "google_plus_url"
        case hours
        case howToEarn = "how_to_earn"
        case instagramHandle = "instagram_handle"
        case isDemo = "is_demo"
        case isFreePlan = "is_free_plan"
        case lat, logo, long, meta
        case modifiedAt = "modified_at"
        case name
        case ondeckEnabled = "ondeck_enabled"
        case paymentType = "payment_type"
        case phone, picture
        case pointLimit = "point_limit"
        case postalCode = "postal_code"
        case rewardDetails = "reward_details"
        case shortname
        case signupBonus = "signup_bonus"
        case signupPromotionUid = "signup_promotion_uid"
        case softwareID = "software_id"
        case state
        case timeZone = "time_zone"
        case twitterHandle = "twitter_handle"
        case twitterURL = "twitter_url"
        case type, uid, url
        case yelpURL = "yelp_url"
    }
}

// MARK: - FluffyLinks
public struct FluffyLinks: Codable {
    let businessGroup, promotions, rewards, linksSelf: BusinessGroup
    let visitedBusinesses: BusinessGroup

    enum CodingKeys: String, CodingKey {
        case businessGroup = "business_group"
        case promotions, rewards
        case linksSelf = "self"
        case visitedBusinesses = "visited_businesses"
    }
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
