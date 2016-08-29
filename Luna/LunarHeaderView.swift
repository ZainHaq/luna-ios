//
//  LunarHeaderView.swift
//  Luna
//
//  Created by Zain Haq on 2016-07-23.
//  Copyright © 2016 Zain Haq. All rights reserved.
//

import UIKit
import Foundation

class LunarHeaderView: UIView {
    
    @IBOutlet weak var phaseIconLabel: UILabel!
    @IBOutlet weak var moonAgeLabel: UILabel!
    @IBOutlet weak var phaseNameLabel: UILabel!
    @IBOutlet weak var moonIlluminationLabel: UILabel!
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var riseLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.phaseIconLabel.text = "hhhhhh"
        self.phaseNameLabel.text = "hhhhhh"
        self.moonAgeLabel.text = "hhhhhh"
        self.moonIlluminationLabel.text = "hhhhhh"
        self.setLabel.text = "hhhhhh"
        self.riseLabel.text = "hhhhhh"

        self.backgroundColor = UIColor.blueColor()
    }
}