//
//  GetMembershipsParams.swift
//  FSApiKit
//
//  Created by Jhon Gomez on 12/21/21.
//

import Foundation

public struct GetMembershipsParams {
    let userId: String
    var queryParams: [String: String]? = nil
    var cookie: String? = nil
    
    public init(userId: String, params: [String: String]? = nil, cookie: String? = nil) {
        self.userId = userId
        self.queryParams = params
        self.cookie = cookie
    }
}
