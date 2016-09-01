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
    
    @IBOutlet weak var moonAgeLabel: UILabel!
    @IBOutlet weak var phaseNameLabel: UILabel!
    @IBOutlet weak var moonIlluminationLabel: UILabel!
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var riseLabel: UILabel!
    
    var viewModel: LunarViewModel? {
        didSet {
            self.riseLabel.text = viewModel?.rise
            self.setLabel.text = viewModel?.set
            
            self.ageLabel.text = viewModel?.age
            self.illuminationLabel.text = viewModel?.illumination
            
            if let phase = viewModel?.phase {
                guard let font = UIFont(name: "EuphemiaUCAS", size: 38.0) else { fatalError() }
                let color = UIColor.whiteColor()
                let attributes = [NSForegroundColorAttributeName: color, NSFontAttributeName: font]
                self.phaseNameLabel.attributedText = NSAttributedString(string: phase, attributes: attributes)
            }
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.phaseView.alpha = 1.0
            })
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.phaseIconLabel.alpha = 0.0
        self.phaseNameLabel.text = "Loading..."
        self.moonAgeLabel.text = ""
        self.moonIlluminationLabel.text = ""
        self.riseLabel.text = ""
        self.setLabel.text = ""
        
        self.phaseNameLabel.textColor = UIColor.whiteColor()
        self.moonAgeLabel.textColor = UIColor.whiteColor()
        self.moonIlluminationLabel.textColor = UIColor.whiteColor()
        self.riseLabel.textColor = UIColor.whiteColor()
        self.setLabel.textColor = UIColor.whiteColor()
        
        self.backgroundColor = UIColor.clearColor()
    }
}