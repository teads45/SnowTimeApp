//
//  yelpReview.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/24/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
 
import Foundation
import UIKit
class yelpTableViewController: UIViewController {
    
        @IBOutlet weak var lodgesTableView: UITableView!
        
        let CPLatitude: Double = 40.1
        let CPLongitude: Double = 111.9
        
        var lodge: [Lodge] = []
          
          override func viewDidLoad() {
              super.viewDidLoad()
              
              lodgesTableView.delegate = self
              lodgesTableView.dataSource = self
              lodgesTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
              lodgesTableView.separatorStyle = .none
              
            retrieveLodges(latitude: CPLatitude, longitude: CPLongitude, category: "ski_Resorts", limit: 20, sortBy: "distance", locale: "en_US") { (response, error) in
                              
                              if let response = response {
                                  self.lodge = response
                                  DispatchQueue.main.async {
                                      self.lodgesTableView.reloadData()
                                  }
                              }
              }
        }
    
}



extension yelpTableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return lodge.count
}
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 300
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
    cell.nameLabel.text = lodge[indexPath.row].name
    cell.ratingLabel.text = String(lodge[indexPath.row].rating ?? 0.0)
    cell.priceLabel.text = lodge[indexPath.row].price ?? "-"
    cell.addressLabel.text = lodge[indexPath.row].address
//    cell.UrlLabel.text = lodge[indexPath.row].url

    return cell
}

}




    
    
/* override func viewDidLoad() {
    retrieveLodges (latitude: CPLatitude, longitude: CPLongitude, limit: 20, category: "ski_Resorts", sortBy: "distance", locale: "en_US") { (response, error) in
            
            if let response = response {
                self.lodge = response
            }
        }
    }
}
*/







/*
@IBOutlet weak var lodgesTableView: UITableView!
    
    /// Central Park, NYC coordinates
    let CPLatitude: Double = 41.782483
    let CPLongitude: Double = -111.963540
    
    var lodges : [Lodge] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lodgesTableView.delegate = self
        lodgesTableView.dataSource = self
        lodgesTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
        lodgesTableView.separatorStyle = .none
        
        retrieveLodges(latitude: CPLatitude, longitude: CPLongitude, category: "gyms",
                       limit: 20, sortBy: "distance", locale: "en_US") { (response, error) in
                        
                        if let response = response {
                            self.venues = response
                            DispatchQueue.main.async {
                                self.venuesTableView.reloadData()
                            }
                        }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Lodges.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        
        cell.nameLabel.text = Lodges[indexPath.row].name
        cell.ratingLabel.text = String(Lodge[indexPath.row].rating ?? 0.0)
        cell.priceLabel.text = Lodges[indexPath.row].price ?? "-"
        cell.isClosed = Lodges[indexPath.row].is_closed ?? false
        cell.addressLabel.text = Lodges[indexPath.row].address
        
        return cell
    }
}
*/
