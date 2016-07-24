//
//  PhaseViewModel.swift
//  Luna
//
//  Created by Zain Haq on 2016-07-24.
//  Copyright © 2016 Zain Haq. All rights reserved.
//

import Foundation

struct PhaseViewModel {
    private let phase: Phase

    init(phase: Phase) {
        self.phase = phase
    }

    var icon: String {
        return phase.name.symbolForMoon()
    }

    var date: String {
        return self.formatter.stringFromDate(phase.date)
    }

    private var formatter: NSDateFormatter {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE, MMMM d yyyy"
        return formatter
    }
}