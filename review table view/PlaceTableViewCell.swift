//
//  PlaceTableViewCell.swift
//  review table view
//
//  Created by cscoi054 on 2017. 2. 4..
//  Copyright © 2017년 a. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    @IBOutlet weak var bkImageView: UIImageView!

    @IBOutlet weak var headingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
