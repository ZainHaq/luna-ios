//
//  Phase.swift
//  Luna
//
//  Created by Zain Haq on 2016-07-24.
//  Copyright © 2016 Zain Haq. All rights reserved.
//

import Foundation

typealias PhaseResult = Result<Phase>
typealias PhasesResult = Result<[Phase]>

struct Phase {
    let name: String
    let date: NSDate
    
    init(_ name: String, _ date: NSDate) {
        self.name = name
        self.date = date
    }
}

extension Phase: Equatable {
    static func phaseFromJSON(json: JSON) -> PhaseResult {
        guard
            let name = json["name"] as? String,
            let interval = json["timestamp"] as? NSTimeInterval
            else {
                return .Failure(JSONError.BadJSON)
        }
        
        let date = NSDate(timeIntervalSince1970: interval)
        let phase = Phase(name, date)
        return .Success(phase)
    }
    
    static func phasesFromJSON(json: JSON) -> PhasesResult {
        guard let data = json["response"] as? [JSON] else {
            return .Failure(JSONError.BadJSON)
        }
        
        let results = data.map(Phase.phaseFromJSON)
        let phases = results.flatMap { (phase) -> Phase? in
            switch phase {
            case .Success(let phase):
                return phase
            case .Failure:
                return nil
            }
        }
        
        return .Success(phases)
    }
}

func ==(lhs: Phase, rhs: Phase) -> Bool {
    return lhs.date == rhs.date && lhs.name == rhs.name
}