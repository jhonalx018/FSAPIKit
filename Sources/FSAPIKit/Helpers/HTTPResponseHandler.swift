//
//  HTPPResponseStateModel.swift
//  FSApiKey
//
//  Created by Jhon Gomez on 12/20/21.
//

import Foundation

struct HTTPResponseHandler {
    static func checkSuccessStatus(response: HTTPURLResponse, in rangeStatusCode: ResponseStatusCode) -> Bool {
        rangeStatusCode.range.contains(response.statusCode)
    }
}
