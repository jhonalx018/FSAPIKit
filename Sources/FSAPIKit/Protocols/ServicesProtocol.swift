//
//  ServicesProtocol.swift
//  
//
//  Created by Jhon Gomez on 12/30/21.
//

import Foundation


public protocol ServicesProtocol {
    var basePath: String { get }
    var env: EnvironmentHelper.Enviroment { get set }
    var httpRequest: HTTPRequest { get set }
}
