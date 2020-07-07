//
//  yelpReview.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/24/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
 
import UIKit


class yelpTableViewController: UIViewController {
    
    
   // @IBOutlet weak var lodgesTableView: UITableView!
    @IBOutlet weak var lodgesTableView: UITableView!
    
    //coordinates for SLC, Utah
    let CPLatitude: Double = 40.744797
    let CPLongitude: Double = -111.928734
    
    var lodges: [Lodges] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        lodgesTableView.delegate = self
        lodgesTableView.dataSource = self
        lodgesTableView.register(UINib(nibName:"CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
        lodgesTableView.separatorStyle = .none
    
        
        
        
        retrieveLodges(latitude: CPLatitude, longitude: CPLongitude, limit: 10, sortBy: "distance", locale: "en_US", category: "Ski_Resorts") { (response, error) in
            
            if let response = response {
                self.lodges = response
                DispatchQueue.main.async{
                    self.lodgesTableView.reloadData()
                    }
                }
        }
    }
}
  

extension yelpTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.nameLabel.text = lodges[indexPath.row].name
        cell.ratingLabel.text = String(lodges[indexPath.row].rating ?? 0.0)
        cell.priceLabel.text = lodges[indexPath.row].price ?? "-"
        cell.addressLabel.text = lodges[indexPath.row].address
        return cell
           
       }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return lodges.count
        
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 300
           
       }
    
     
}

   /* func setStarNumber(_ selected: false, animated: true) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
     */
//MARK: Yelp Client ID and API KEY
/*

*/
