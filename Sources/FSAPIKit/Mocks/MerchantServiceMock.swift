//
//  MerchantServiceMock.swift
//  
//
//  Created by Jhon Gomez on 1/3/22.
//

import Foundation


public struct MerchantServiceMock {
    public static let parameters = MerchantServiceParams(
        queryParams:  [ "service": "grubhub", "status": "available" ],
        headers :  [
            "Authorization": "Basic REFZaUR6UEdQZklpTHBqR01Ebmw6cnQyMnNKVWhlSm5TQ01GeloxakY="
        ]
    )
}
