//
//  EnvironmentHelper.swift
//  FSApiKit
//
//  Created by Jhon Gomez on 12/21/21.
//

import Foundation

public struct EnvironmentHelper {
    public enum Enviroment: String {
        case staging
        case production
        case development
        case nerfstars
    }
    
    public static let domains: [Enviroment: String] = [
        .production: "https://mobile-ordering-proxy.nerfstars.com",
        .staging: "https://mobile-ordering-proxy.nerfstars.com",
        .development: "https://mobileapi.nerfstars.com",
        .nerfstars: "https://api.nerfstars.com"
    ]
}
