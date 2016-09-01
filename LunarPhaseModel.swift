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
        let moon =  Moon("full moon", 14, 5, 5, NSDate(), NSDate())
        return moon
    }

    func currentPhases() -> [Phase] {
        let phase1 = Phase("first quarter", NSDate())
        let phase3 = Phase("third quarter", NSDate())
        return [phase1, phase3]
    }
}
