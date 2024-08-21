//
//  MembershipServices.swift
//  FSApiKey
//
//  Created by Jhon Gomez on 12/20/21.
//

import Foundation
import Combine

public struct MembershipService: ServicesProtocol {
    public let basePath: String = "/api/unified/users/"
    public var env: EnvironmentHelper.Enviroment = .development
    // MOVE TO INJECTION
    public var httpRequest = HTTPRequest()
    
    public init() {}
    
    @available(macOS 10.15, *)
    public func getMemberships(for params: GetMembershipsParams, _ callback: @escaping (Response<VisitedBusinesses>) -> Void) {
        let url = "\(EnvironmentHelper.domains[self.env]!)\(self.basePath)\(params.userId)/memberships"
        
        self.httpRequest.callbackRequester(for: HTTPRequestModel<VisitedBusinesses>(
            url: url,
            queryParams: params.queryParams,
            cookie: params.cookie,
            callback: callback
        ), with: HTTPMethods.GET)
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    public func asyncGetMemberships(for params: GetMembershipsParams) async throws -> Response<VisitedBusinesses> {
        let url = "\(EnvironmentHelper.domains[self.env]!)\(self.basePath)\(params.userId)/memberships"
        
        return try await self.httpRequest.asyncRequester(for: HTTPRequestModel<VisitedBusinesses>(
            url: url,
            queryParams: params.queryParams,
            cookie: params.cookie
        ), with: HTTPMethods.GET)
    }
    
    @available(iOS 13.0, *)
    @available(macOS 12.0, *)
    public func combineGetMemberships(for params: GetMembershipsParams) -> AnyPublisherRequest<VisitedBusinesses> {
        let url = "\(EnvironmentHelper.domains[self.env]!)\(self.basePath)\(params.userId)/memberships"
        
        return self.httpRequest.combineRequester(
            for: HTTPRequestModel<VisitedBusinesses>(
                url: url,
                queryParams: params.queryParams,
                cookie: params.cookie
            ), with: HTTPMethods.GET
        )
    }
}
