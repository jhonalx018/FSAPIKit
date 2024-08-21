//
//  MembershipsServiceV3.swift
//  
//
//  Created by Jhon Gomez on 2/4/22.
//

import Foundation

public struct MembershipsV3: ServicesProtocol {
    public var env: EnvironmentHelper.Enviroment = .development
    public let basePath: String = "/api/unified/users"
    public var httpRequest = HTTPRequest()
    
    public init() {
    }
    
    
    @available(iOS 13.0, *)
    @available(macOS 12.0, *)
    public func combineGetRewards(for parameters: GetMembershipsParams) -> AnyPublisherRequest<WelcomeV3> {
        let url = "\(EnvironmentHelper.domains[self.env]!)\(self.basePath)/\(parameters.userId)/memberships"

        return self.httpRequest.combineRequester(
            for: HTTPRequestModel<WelcomeV3>(
                url: url,
                queryParams: parameters.queryParams
            ),
            with: HTTPMethods.GET
        )
    }
}
