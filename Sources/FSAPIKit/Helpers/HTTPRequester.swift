//
//  Requester.swift
//  FSApiKey
//
//  Created by Jhon Gomez on 12/20/21.
//

import Foundation
import SwiftUI
import Combine

public class HTTPRequest: Parser {
    public var session: URLSession = URLSession.shared
    
    public init(urlSession: URLSession? = nil) {
        if let wrappedSession = urlSession {
            self.session = wrappedSession
        }
    }
}

