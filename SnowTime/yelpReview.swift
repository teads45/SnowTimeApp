//
//  yelpReview.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/24/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
 
import UIKit
import MapKit
import CoreLocation

class yelpTableViewController: UIViewController{
    
    //set up core data for each user

    // override func viewDidLoad() {
    //     super.viewDidLoad()
    
             
         
     
   // @IBOutlet weak var lodgesTableView: UITableView!
    @IBOutlet weak var lodgesTableView: UITableView!
    
    
    
    //coordinates for SLC, Utah
   // let CPLatitude = skiLodge.coordinate
   // let CPLongitude: Double = -111.928734
    
    var lodges: [Lodges] = []
    var locationManager = CLLocationManager()
     
     override func viewDidLoad() {
       super.viewDidLoad()
         
    
   
   _ = CLLocation(latitude: 44.1, longitude: -111.1)
   var currentLoc: CLLocation!
   if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse) {
       currentLoc = locationManager.location
   }
         let skiLodge = CLLocation(latitude: currentLoc.coordinate.latitude , longitude: currentLoc.coordinate.longitude)
     //    let regionRadius: CLLocationDistance = 800000.0
     //    let region = MKCoordinateRegion(center: skiLodge.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
      //   lodgesMap.setRegion(region, animated: false)
      //   lodgesMap.delegate = self
     
        
        //coordinates for SLC, Utah
        let CPLatitude = skiLodge.coordinate.latitude
        let CPLongitude = skiLodge.coordinate.longitude
        
    
        
        ///above is location management and below is table management
        
        
        
        
        
        
        lodgesTableView.delegate = self
        lodgesTableView.dataSource = self
        lodgesTableView.register(UINib(nibName:"CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
        lodgesTableView.separatorStyle = .none
    
        
        
        ///Sort by value needs to be dynamic to meet user needs -- myArray.sorted(by: >) // [3, 2, 1]
        /// values will be in ratingcontrol view controller
        
        
        retrieveLodges(latitude: CPLatitude, longitude: CPLongitude, limit: 10, sortBy: "price", locale: "en_US", category: "Ski_Resorts") { (response, error) in
            
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
