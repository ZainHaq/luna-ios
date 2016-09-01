//
//  QueryParamaters.swift
//  Luna
//
//  Created by Zain on 8/31/16.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import Foundation

func queryWithParameters(parameters: [String: String]) -> String {
    return parameters.keys.reduce("") { (string, key) -> String in
        let prefix = (string == "") ? "" : "&"
        guard let value = parameters[key] else { fatalError("missing value") }
        return "\(string)\(prefix)\(key)=\(value)"
    }
}
