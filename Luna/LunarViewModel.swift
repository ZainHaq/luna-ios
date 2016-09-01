//
//  LunarViewModel.swift
//  Luna
//
//  Created by Zain on 9/1/16.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import Foundation

struct LunarViewModel {
    
    private let moon: Moon
    
    init(moon: Moon) {
        self.moon = moon
    }
    
    var icon: String {
        return moon.percent.symbolForMoon()
    }
    
    var phase: String {
        return moon.phase.capitalizedString
    }
    
    var rise: String {
        return self.formatter.stringFromDate(moon.rise)
    }
    
    var set: String {
        return self.formatter.stringFromDate(moon.set)
    }
    
    var age: String {
        let length = 27.3
        let age = ((moon.percent * 0.01) * length) * 100.0
        
        switch age {
        case 1:
            let day = String(format: "%.1f", age)
            return "\(day) day old"
        default:
            let days = String(format: "%.1f", age)
            return "\(days) days old"
        }
    }
    
    var illumination: String {
        let percent = String(format: "%.1f", moon.percent * 100)
        return "\(percent)% complete"
    }
    
    private var formatter: NSDateFormatter {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM d yyyy 'at' h:mm a z"
        return formatter
    }
}
