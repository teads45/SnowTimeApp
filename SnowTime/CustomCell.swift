//
//  CustomCell.swift
//  SnowTime
//
//  Created by Thomas Eads on 7/7/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
 
    @IBOutlet weak var parentView:UIView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var ratingLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var distanceLabel:UILabel!
    @IBOutlet weak var addressLabel:UILabel!
    @IBOutlet weak var UrlLabel:UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 25
    }

    
}
