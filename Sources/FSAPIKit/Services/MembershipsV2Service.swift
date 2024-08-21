//
//  MembershipsV2.swift
//
//
//  Created by Jhon Gomez on 12/30/21.
//

import Foundation


public struct MembershipsV2: ServicesProtocol {
    public var env: EnvironmentHelper.Enviroment = .nerfstars
    public let basePath: String = "/api/v2/memberships"
    public var httpRequest = HTTPRequest()
    
    public init() {
    }
    
    
    @available(iOS 13.0, *)
    @available(macOS 12.0, *)
    public func combineGetRewards(for parameters: GetMembershipsParams) -> AnyPublisherRequest<RewardsV2> {
        let url = "\(EnvironmentHelper.domains[self.env]!)\(self.basePath)"

        return self.httpRequest.combineRequester(
            for: HTTPRequestModel<RewardsV2>(
                url: url,
                queryParams: parameters.queryParams
            ),
            with: HTTPMethods.GET
        )
    }
}
