//
//  NSData+JSON.swift
//  Luna
//
//  Created by Zain on 8/31/16.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import Foundation

public enum JSONError: ErrorType {
    case BadJSON
    case NoJSON
}

typealias JSON = [String: AnyObject]
typealias JSONResult = Result<JSON>

extension NSData {
    func toJSON() -> JSONResult {
        do {
            let obj = try NSJSONSerialization.JSONObjectWithData(self, options: [])
            guard let json = obj as? JSON else { return .Failure(JSONError.NoJSON) }
            return .Success(json)
        }
        catch {
            return .Failure(JSONError.BadJSON)
        }
    }
}

// wrapper function for clarity
func JSONResultFromData(data: NSData) -> JSONResult {
    return data.toJSON()
}
