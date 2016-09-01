//
//  NSDate+Phase.swift
//  Luna
//
//  Created by Zain on 8/31/16.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import Foundation

extension NSDate {
    
    func moonPhase() -> Double {
        let phase = (self.julianDate() + 4.867) / self.lunarSynodicPeriod()
        return (phase - floor(phase))
    }
    
    // MARK:- moon calculation tingz
    private func epochJulianDate() -> Double {
        return 2440587.5
    }
    
    private func lunarSynodicPeriod() -> Double {
        return 29.53059
    }
    
    private func julianDate() -> Double {
        return epochJulianDate() + self.timeIntervalSince1970 / 86400
    }
}