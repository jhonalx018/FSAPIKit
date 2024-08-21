//
//  MembershipServiceDataMock.swift
//  FSApiKit
//
//  Created by Jhon Gomez on 12/21/21.
//

import Foundation

public struct MembershipServiceDataMock {
    public static let getMermbershipParams: GetMembershipsParams = GetMembershipsParams(
        userId: "9eb1b803b7c9409898ecaf81e2195d5c",
        params: [
            "limit": "30",
            "offset": "0",
            "embed": "visited_businesses,promotions,rewards"
        ],
        cookie: "session_token=34jzb7a614myloxuvq2jibxj62hbeluw"
    )
    
    public static let getMermbershipParamsV2: GetMembershipsParams = GetMembershipsParams(
        userId: "",
        params: [
            "session_token": "fpbvi0swv4y74nkm58spv0izck0f1qwr"
        ],
        cookie: ""
    )
    
    public static let getMermbershipParamsV3: GetMembershipsParams = GetMembershipsParams(
        userId: "688b32dddca947cda805804ab78d7971",
        params: [
            "session_token": "jjr25tx0cl0udpxiaujgyovur94o4pra",
            "limit": "1500",
            "offset": "0",
            "embed": "visited_businesses,promotions,rewards"
        ],
        cookie: ""
    )
}
