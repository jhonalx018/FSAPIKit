//
//  HTTPFullRequestExtension.swift
//  
//
//  Created by Jhon Gomez on 12/30/21.
//

import Foundation

extension HTTPRequest {
    @available(macOS 10.15, *)
    public func callbackRequester<R: Codable>(for request: HTTPRequestModel<R>, with method: HTTPMethods) {
        let requestConf = self.getRequestConfWithHeader(request: request, for: method)
        
        self.performCallbackRequest(requestConf: requestConf, request: request)
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    public func asyncRequester<R: Codable>(for request: HTTPRequestModel<R>, with method: HTTPMethods) async throws -> Response<R> {
        let requestConf = self.getRequestConfWithHeader(request: request, for: method)
        
        return try await self.performRequestAwait(requestConf: requestConf, request: request)
    }
    
    @available(macOS 12.0, *)
    @available(iOS 13.0, *)
    public func combineRequester<R: Codable>(for request: HTTPRequestModel<R>, with method: HTTPMethods) -> AnyPublisherRequest<R> {
        let requestConf = self.getRequestConfWithHeader(request: request, for: method)

        return self.performCombineRequest(requestConf: requestConf, request: request)
    }
    
    @available(macOS 10.15, *)
    public func callbackRequesterWithBody<BodyType: Codable, R: Codable>(for request: HTTPRequestModel<R>, body: BodyType, with method: HTTPMethods) {
        var requestConf = self.getRequestConfWithHeader(request: request, for: method)
        self.getParsedBody(for: &requestConf, body: body)

        self.performCallbackRequest(requestConf: requestConf, request: request)
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    public func asyncRequesterWithBody<BodyType: Codable, R: Codable>(for request: HTTPRequestModel<R>, body: BodyType, with method: HTTPMethods) async throws -> Response<R> {
        var requestConf = self.getRequestConfWithHeader(request: request, for: method)
        self.getParsedBody(for: &requestConf, body: body)
        
        return try await self.performRequestAwait(requestConf: requestConf, request: request)
    }
    
    @available(macOS 12.0, *)
    @available(iOS 13.0, *)
    public func combineRequesterWithBody<BodyType: Codable, R: Codable>(for request: HTTPRequestModel<R>, body: BodyType, with method: HTTPMethods) -> AnyPublisherRequest<R> {
        var requestConf = self.getRequestConfWithHeader(request: request, for: method)
        self.getParsedBody(for: &requestConf, body: body)

        return self.performCombineRequest(requestConf: requestConf, request: request)
    }
    
    private func getParsedBody<BodyType: Codable>(for requestConf: inout URLRequest, body: BodyType) {
        requestConf.httpMethod = HTTPMethods.POST.rawValue
        requestConf.httpBody = self.toJson(for: body) as Data?
    }
}
