//
//  PhaseTableViewCell.swift
//  Luna
//
//  Created by Zain-Ul Haq on 2016-07-23.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import UIKit

class PhaseTableViewCell: UITableViewCell {

    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.iconLabel.text = ""
        self.dateLabel.text = ""

        self.selectionStyle = UITableViewCellSelectionStyle.None
    }

}