//
//  API.swift
//  Luna
//
//  Created by Zain on 8/31/16.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import Foundation

import Foundation
import CoreLocation

struct clientCredentials {
    private static let clientSecret = "tL8xrXUqI5r878vV9KhqWQLS6VsluzWOFdHjahKP"
    private static let clientId = "CvS8OA03pJCeKEVmRECQ9"
}

enum AerisAPI: Request {
    case Moon(CLLocation)
    case MoonPhases(CLLocation)
    
    static let baseURL = "https://api.aerisapi.com"
    static let phasesLimit = 5
    
    var baseURL: NSURL {
        return NSURL(string: AerisAPI.baseURL)!
    }
    
    var parameters: [String: String] {
        switch self {
        case .Moon:
            return ["client_id": clientCredentials.clientId, "client_secret": clientCredentials.clientSecret]
        case .MoonPhases:
            return ["client_id": clientCredentials.clientId, "client_secret": clientCredentials.clientSecret, "limit": String(AerisAPI.phasesLimit)]
        }
    }
    
    var path: String {
        switch self {
        case .Moon(let location):
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let queryString = queryWithParameters(parameters)
            return "\(baseURL)/sunmoon/\(latitude),\(longitude)?\(queryString)"
        case .MoonPhases(let location):
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let queryString = queryWithParameters(parameters)
            return "\(baseURL)/sunmoon/moonphases/\(latitude),\(longitude)?\(queryString)"
        }
    }
    
    var request: NSURLRequest {
        let path = self.path
        guard let url = NSURL(string: path) else { fatalError("bad url") }
        return NSURLRequest(URL: url, cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 60.0)
    }
}
