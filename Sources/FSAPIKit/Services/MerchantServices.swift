//
//  MerchantServices.swift
//  
//
//  Created by Jhon Gomez on 12/30/21.
//

import Foundation


public struct MerchantServices: ServicesProtocol {
    public var env: EnvironmentHelper.Enviroment = .development
    public let basePath: String = "/api/v1/services" 
    public var httpRequest = HTTPRequest()
    
    public init(environment: EnvironmentHelper.Enviroment) {
        self.env = environment
    }
    
    @available(macOS 10.15, *)
    public func checkServiceAvalability(for parameters: MerchantServiceParams, _ callback: @escaping (Response<MerchantServicesModel>) -> Void) {
        let url = "\(EnvironmentHelper.domains[self.env]!)\(self.basePath)"
        
        self.httpRequest.callbackRequester(for: HTTPRequestModel<MerchantServicesModel>(
            url: url,
            queryParams: parameters.queryParams,
            headers: parameters.headers,
            responseStatusCode: .successfull,
            callback: callback
        ), with: HTTPMethods.POST)
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    public func asyncCheckServiceAvalability(for parameters: MerchantServiceParams) async throws -> Response<MerchantServicesModel> {
        let url = "\(EnvironmentHelper.domains[self.env]!)\(self.basePath)"

        return try await self.httpRequest.asyncRequester(for: HTTPRequestModel<MerchantServicesModel>(
            url: url,
            queryParams: parameters.queryParams,
            headers: parameters.headers
        ), with: HTTPMethods.POST)
    }

    @available(iOS 13.0, *)
    @available(macOS 12.0, *)
    public func combineCheckServiceAvalability(for parameters: MerchantServiceParams) -> AnyPublisherRequest<MerchantServicesModel> {
        let url = "\(EnvironmentHelper.domains[self.env]!)\(self.basePath)"

        return self.httpRequest.combineRequester(
            for: HTTPRequestModel<MerchantServicesModel>(
                url: url,
                queryParams: parameters.queryParams,
                headers: parameters.headers
            ),
            with: HTTPMethods.POST
        )
    }
}
