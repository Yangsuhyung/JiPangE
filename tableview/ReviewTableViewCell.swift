//
//  ReviewTableViewCell.swift
//  review table view
//
//  Created by cscoi054 on 2017. 2. 3..
//  Copyright © 2017년 a. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var ratingControl: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
