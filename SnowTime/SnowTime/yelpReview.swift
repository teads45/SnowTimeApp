//
//  yelpReview.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/24/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
 
import Foundation
import UIKit
import MapKit
import CoreLocation


class yelpTableViewController: UIViewController, MKMapViewDelegate {
    
    // store var
    var switchValue: String!
    // pass index through for Mi or Km
    func myCustomInit(switchValue: String){
        self.switchValue = switchValue
    }
    @IBOutlet weak var lodgesTableView: UITableView!
        // insert Core data to set CPLat and long
    var locationManager = CLLocationManager()
    
       //for image retrieval
    
        var lodge: [Lodge] = []
   // var pickerData: [pickerData] = []
   // var stringDataForSortBy = "price"
          override func viewDidLoad() {
              super.viewDidLoad()
            
            
            
            //update picker label
            let CPLatitude = CLLocationDegrees()
            let CPLongitude = CLLocationDegrees()
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
            _ = CLLocation(latitude: 44.1, longitude: -111.1)
            var currentLoc = CLLocation(latitude: 44.1, longitude: -111.1)
            if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways) {
                currentLoc = locationManager.location ?? currentLoc
            }
            
            
            
              lodgesTableView.delegate = self
              lodgesTableView.dataSource = self
              lodgesTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
              lodgesTableView.separatorStyle = .none
              
            retrieveLodges(latitude: CPLatitude, longitude: CPLongitude, category: "ski_Resorts,Snowboarding", limit: 20, sortBy: "rating", locale: "en_US", address: "display_address", distance: "distance"/*, url: "url"*/) { (response, error) in
                              
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
    cell.distanceLabel.text = lodge[indexPath.row].distance
    //cell.urlButton = lodge[indexPath.row].url

    return cell
}
    

}
