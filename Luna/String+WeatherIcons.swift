//
//  String+WeatherIcons.swift
//  Luna
//
//  Created by Zain Haq on 2016-07-23.
//  Copyright © 2016 Zain Haq. All rights reserved.
//

import Foundation

extension String {

    func symbolForMoon() -> String {
        switch self {
        case "new moon":
            return "\u{f095}"
        case "first quarter":
            return "\u{f09c}"
        case "full moon":
            return "\u{f0a3}"
        case "last quarter":
            return "\u{f0aa}"

        default:
            return "X"
        }
    }
}
