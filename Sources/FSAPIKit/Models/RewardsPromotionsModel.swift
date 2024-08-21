//
//  RewardsV3PromotionsModel.swift
//
//
//  Created by Jhon Gomez on 2/4/22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   public let welcomeV3 = try? newJSONDecoder().decode(WelcomeV3.self, from: jsonData)


// MARK: - PurpleEmbedV3
public struct PurpleEmbedV3: Codable {
    public let promotions: WelcomeV3
    public let rewards: RewardsV3
    public let visitedBusinesses: VisitedBusinessesV3

    public enum CodingKeys: String, CodingKey {
        case promotions, rewards
        case visitedBusinesses = "visited_businesses"
    }
}

// MARK: - PurpleMetaV3
public struct PurpleMetaV3: Codable {
    public let embed: PurpleEmbedV3
    public let links: FluffyLinksV3
}

// MARK: - WelcomeV3Item
public struct WelcomeV3Item: Codable {
    public let businessGroupUid, createdAt: String
    public let lastVisit: String?
    public let lifetimePoints: Int
    public let meta: PurpleMetaV3
    public let points: Int
    public let uid: String
    public let userUid: UserUidV3
    public let vip: String?
    public let visits: Int

    public enum CodingKeys: String, CodingKey {
        case businessGroupUid = "business_group_uid"
        case createdAt = "created_at"
        case lastVisit = "last_visit"
        case lifetimePoints = "lifetime_points"
        case meta, points, uid
        case userUid = "user_uid"
        case vip, visits
    }
}

// MARK: - WelcomeV3
public struct WelcomeV3: Codable {
    public let items: [WelcomeV3Item]?
    public let meta: WelcomeV3Meta?
}

// MARK: - RewardsV3
public struct RewardsV3: Codable {
    public let items: [RewardsV3Item]?
    public let meta: WelcomeV3Meta?
}

// MARK: - RewardsV3Item
public struct RewardsV3Item: Codable {
    public let meta: FluffyMetaV3
    public let perk: String?
    public let pointCost: Int?
    public let uid: String
    public let perkShortname: String?

    public enum CodingKeys: String, CodingKey {
        case meta, perk
        case pointCost = "point_cost"
        case uid
        case perkShortname = "perk_shortname"
    }
}

// MARK: - FluffyMetaV3
public struct FluffyMetaV3: Codable {
    public let embed: FluffyEmbedV3
    public let links: PurpleLinksV3
}

// MARK: - FluffyEmbedV3
public struct FluffyEmbedV3: Codable {
}

// MARK: - PurpleLinksV3
public struct PurpleLinksV3: Codable {
    public let linksSelf: BusinessGroupV3

    public enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - BusinessGroupV3
public struct BusinessGroupV3: Codable {
    public let href: String
    public let type: TypeEnum
}

public enum TypeEnum: String, Codable {
    case collection = "collection"
    case document = "document"
}

// MARK: - WelcomeV3Meta
public struct WelcomeV3Meta: Codable {
    public let limit: Int
    public let next: String
    public let offset: Int
    public let previous: JSONNull?
}

// MARK: - VisitedBusinessesV3
public struct VisitedBusinessesV3: Codable {
    public let items: [VisitedBusinessesV3Item]
    public let meta: WelcomeV3Meta
}

// MARK: - VisitedBusinessesV3Item
public struct VisitedBusinessesV3Item: Codable {
    public let addressLine1: String
    public let addressLine2: AddressLine2?
    public let beaconInstalled: Bool
    public let businessCategoryName: BusinessCategoryName
    public let businessGroupUid, businessTypeUid, city: String
    public let ctsEnabled, ctsManyToManyEnabled: Bool
    public let itemDescription: String
    public let displayLabelNew: JSONNull?
    public let facebookPageID: Int?
    public let facebookPageURL: String?
    public let fromTheOwner: String?
    public let googlePlusURL: String?
    public let hours: String?
    public let howToEarn: String
    public let instagramHandle: String?
    public let isDemo, isFreePlan: Bool
    public let lat: String
    public let logo: String
    public let long: String
    public let meta: FluffyMetaV3
    public let modifiedAt, name: String
    public let ondeckEnabled: Bool
    public let paymentType: PaymentType?
    public let phone: String
    public let picture: String?
    public let pointLimit: Int
    public let postalCode: String
    public let rewardDetails: String?
    public let shortname: String
    public let signupBonus, signupPromotionUid: String?
    public let softwareID, state: String
    public let timeZone: TimeZone
    public let twitterHandle: TwitterHandle?
    public let twitterURL: String?
    public let type, uid: String
    public let url, yelpURL: String?

    public enum CodingKeys: String, CodingKey {
        case addressLine1 = "address_line1"
        case addressLine2 = "address_line2"
        case beaconInstalled = "beacon_installed"
        case businessCategoryName = "business_category_name"
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

public enum AddressLine2: String, Codable {
    case empty = ""
    case ste200 = "Ste# 200"
    case steG1 = "Ste G-1"
    case suite200 = "Suite 200"
    case suite4 = "Suite 4"
}

public enum BusinessCategoryName: String, Codable {
    case activeLife = "Active Life"
    case artsEntertainment = "Arts & Entertainment"
    case beautySPA = "Beauty & Spa"
    case food = "Food"
    case homeService = "Home Service"
    case hotelTravel = "Hotel & Travel"
    case localService = "Local Service"
    case shopping = "Shopping"
}

public enum PaymentType: String, Codable {
    case payAtCounter = "Pay at Counter"
    case payAtTable = "Pay at Table"
}

public enum TimeZone: String, Codable {
    case usAlaska = "US/Alaska"
    case usArizona = "US/Arizona"
    case usCentral = "US/Central"
    case usEastern = "US/Eastern"
    case usMountain = "US/Mountain"
    case usPacific = "US/Pacific"
}

public enum TwitterHandle: String, Codable {
    case eatcreambar = "@eatcreambar"
    case empty = ""
    case pacthaisc = "@pacthaisc"
    case vcafesf = "@vcafesf"
}

// MARK: - FluffyLinksV3
public struct FluffyLinksV3: Codable {
    public let businessGroup, promotions, rewards, linksSelf: BusinessGroupV3
    public let visitedBusinesses: BusinessGroupV3

    public enum CodingKeys: String, CodingKey {
        case businessGroup = "business_group"
        case promotions, rewards
        case linksSelf = "self"
        case visitedBusinesses = "visited_businesses"
    }
}

public enum UserUidV3: String, Codable {
    case the7C245036984B45Efb15354702D536B8C = "7c245036984b45efb15354702d536b8c"
}

// MARK: - Encode/decode helpers


