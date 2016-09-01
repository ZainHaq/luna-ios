//
//  PhaseTableViewCell.swift
//  Luna
//
//  Created by Zain-Ul Haq on 2016-07-23.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import UIKit

class PhaseTableViewCell: UITableViewCell {

    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    var viewModel: PhaseViewModel? {
        didSet {
            self.iconLabel.text = viewModel?.icon
            self.dateLabel.text = viewModel?.date
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.iconLabel.text = ""
        self.dateLabel.text = ""

        self.iconLabel.font = UIFont(name: "Weather Icons", size: 32.0)

        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        self.backgroundColor = UIColor.whiteColor()
    }

}
