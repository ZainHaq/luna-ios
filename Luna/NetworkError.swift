//
//  NetworkError.swift
//  Luna
//
//  Created by Zain Haq on 2016-07-24.
//  Copyright © 2016 Zain Haq. All rights reserved.
//

import Foundation

public enum NetworkError: ErrorType {
    case BadStatusCode(statusCode: Int)
    case BadResponse
    case BadJSON
    case NoData
    case Other
}

extension NetworkError: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .BadResponse:
            return "Bad response object returned"
        case .BadJSON:
            return "Bad JSON object, unable to parse"
        case .NoData:
            return "No response data"
        case .BadStatusCode(let statusCode):
            return "Bad status code: \(statusCode)"
        case .Other(let error):
            return "\(error)"
        }
    }
}