//
//  MerchantServiceParams.swift
//  
//
//  Created by Jhon Gomez on 1/3/22.
//

import Foundation


public struct MerchantServiceParams {
    let queryParams: [String: String]
    let headers: [String: String]
    
    public init(queryParams: [String: String], headers: [String: String]) {
        self.queryParams = queryParams
        self.headers = headers
    }
}
