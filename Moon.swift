//
//  Moon.swift
//  Luna
//
//  Created by Zain Haq on 2016-07-24.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import Foundation

typealias MoonResult = Result<Moon>

struct Moon {
    let phase: String
    let age: Double
    let percent: Double
    
    let illumination: Int
    
    let rise: NSDate
    let set: NSDate
    
    init(_ phase: String, _ age: Double, _ percent: Double, _ illumination: Int, _ rise: NSDate, _ set: NSDate) {
        self.phase = phase
        self.age = age
        self.percent = percent
        self.illumination = illumination
        self.rise = rise
        self.set = set
    }
}

extension Moon {
    static func moonFromJSON(json: JSON) -> MoonResult {
        guard
            let response = json["response"] as? [JSON],
            let moonObj = response.first?["moon"] as? JSON,
            let phase = moonObj["phase"] as? JSON,
            let phaseName = phase["name"] as? String,
            let age = phase["age"] as? Double,
            let percent = phase["phase"] as? Double,
            let illum = phase["illum"] as? Int
            else {
                return .Failure(JSONError.BadJSON)
        }
        
        let riseInterval = moonObj["rise"] as? Double ?? 0
        let setInterval = moonObj["set"] as? Double ?? 0
        
        let rise = NSDate(timeIntervalSince1970: riseInterval)
        let set = NSDate(timeIntervalSince1970: setInterval)
        
        let moon = Moon(phaseName, age, percent, illum, rise, set)
        return .Success(moon)
    }
}

extension Moon: Equatable { }

func ==(lhs: Moon, rhs: Moon) -> Bool {
    return lhs.phase == rhs.phase && lhs.age == rhs.age &&
        lhs.rise == lhs.rise && lhs.set == lhs.set
}