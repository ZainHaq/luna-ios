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

        self.phaseIconLabel.text = ""
        self.phaseNameLabel.text = ""
        self.moonAgeLabel.text = ""
        self.moonIlluminationLabel.text = ""
        self.setLabel.text = ""
        self.riseLabel.text = ""

        self.backgroundColor = UIColor.blackColor()
    }
}