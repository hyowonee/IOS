//
//  CustomCell.swift
//  TableViewExample
//
//  Created by NEXT on 2018. 1. 13..
//  Copyright © 2018년 hyowon. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
