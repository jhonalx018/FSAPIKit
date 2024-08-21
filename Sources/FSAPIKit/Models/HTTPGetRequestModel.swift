//
//  HTTPGetRequestProtocol.swift
//  FSApiKey
//
//  Created by Jhon Gomez on 12/20/21.
//

import Foundation

public struct HTTPRequestModel<R: Decodable> {
    var url: String = ""
    var queryParams: [String: String]? = nil
    var headers: [String: String] = [:]
    var cookie: String? = ""
    var callback: (Response<R>) -> Void
    var expectedStatusCode: ResponseStatusCode
    
    public init(url: String = "",
                queryParams: [String: String]? = [:],
                headers: [String: String] = [:],
                cookie: String? = "",
                responseStatusCode: ResponseStatusCode = ResponseStatusCode.successfull,
                callback: @escaping (Response<R>) -> Void = {_ in }
    ) {
        self.url = url
        self.queryParams = queryParams
        self.headers = headers
        self.cookie = cookie
        self.callback = callback
        self.expectedStatusCode = responseStatusCode
    }
}
