//
//  LoggableExtension.swift
//  
//
//  Created by Jhon Gomez on 1/3/22.
//

import Foundation

extension Loggable {
    public func debug(message: String) {
            print("DEBUG \(self): \(message)")
    }
}
