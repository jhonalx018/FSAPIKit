//
//  ResponseModel.swift
//  
//
//  Created by Jhon Gomez on 12/28/21.
//

import Foundation
import Combine

public enum NetworkError: Error {
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
    case encodingError(Error)
}

public enum ResponseStatusCode: Int {
    case informational
    case successfull
    case redirectional
    case clientError
    case serverError

    var range: Range<Int> {
        switch self {
            case .informational: return 100..<200
            case .successfull: return 200..<300
            case .redirectional: return 300..<400
            case .clientError:  return 400..<500
            case .serverError: return 500..<600
        }
    }
}

public typealias Response<R> = Result<R, NetworkError>

@available(macOS 12.0.0, *)
@available(iOS 13.0.0, *)
public typealias AnyPublisherRequest<R> = AnyPublisher<Response<R>, Never>
