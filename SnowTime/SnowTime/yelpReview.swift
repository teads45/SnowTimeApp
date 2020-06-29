//
//  yelpReview.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/24/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
 
import UIKit


class yelpTableViewController: UITableViewController{
    
}

class yelpReviewTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var imageViewForLodge: UIImageView!
    @IBOutlet weak var LodgeDescription: UILabel!
    
    @IBOutlet weak var LodgeMatchRating: UIStackView!
    
    /* func setStarNumber(_ selected: false, animated: true) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
     */
    }

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}



//MARK: Yelp Client ID and API KEY

