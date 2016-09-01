//
//  Request.swift
//  Luna
//
//  Created by Zain on 8/31/16.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import Foundation

public protocol Request {
    var baseURL: NSURL { get }
    var path: String { get }
    var parameters: [String: String] { get }
    
    var request: NSURLRequest { get }
}

extension Request {
    var path: String { return "" }
    var parameters: [String: String] { return [:] }
}