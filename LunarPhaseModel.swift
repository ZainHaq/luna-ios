//
//  LunarPhaseModel.swift
//  Luna
//
//  Created by Zain Haq on 2016-07-24.
//  Copyright © 2016 Zain Haq. All rights reserved.
//

import Foundation

class LunarPhaseModel {

    // dummy data for now

    func currentMoon() -> Moon {
        let moon =  Moon(phase: "full moon", age: 14, rise: NSDate(), set: NSDate())
        return moon
    }

    func currentPhases() -> [Phase] {
        let phase1 = Phase(name: "first quarter", date: NSDate())
        let phase2 = Phase(name: "full moon", date: NSDate())
        let phase3 = Phase(name: "third quarter", date: NSDate())
        return [phase1, phase2, phase3]
    }
}
