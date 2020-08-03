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


class yelpTableViewController: UIViewController, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    // store var
    var switchValue: String!
    // pass index through for Mi or Km
    func myCustomInit(switchValue: String){
        self.switchValue = switchValue
    }
    //List of Vars for math in retrieve lodges function
    let meterToMileConversion = 0.000621371
    let meterToKmConversion = 10.0
    var distanceInMeters:Double = 0.0
    var distanceInMiles:String = " miles"
    
    
    
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
    return cell
}
   

    
    func retrieveLodges(latitude: CLLocationDegrees,
                                   longitude: CLLocationDegrees,
                                   category: String,
                                   limit: Int,
                                   sortBy: String,
                                   locale: String,
                                   address: String,
                                   distance: String,
                                   //url: String,
                                   completionHandler: @escaping ([Lodge]?, Error?) -> Void) {

                   // set up server variable as the correct server location
                   let server = "http://localhost:8080"
                   
                   //give it identifier
                   let url = URL(string: server)
               
                   var getData = URLRequest(url: url!)
                   getData.httpMethod = "GET"
               
               //Initialize session and task
               URLSession.shared.dataTask(with: getData){ (data , response, error)
               in
               if let error = error {
                  
                   completionHandler(nil, error)
                   
               }
               do {
                   //read data as JSON
                   //  let json = try JSONSerialization.jsonObject(with: data!, options: [])
                   let json = try JSONSerialization.jsonObject(with: data!, options: [])
                   //main dictionary
                   guard let resp = json as? NSDictionary else {return}
                   
                   //businesses
                   guard let businesses = resp.value(forKey: "businesses") as?
                       [NSDictionary] else { return }
           
                   var lodgesList: [Lodge] = []
                   
                   
                   //accessing each business
                   for business in businesses {
               
                   // set each lodge value for the custom cells
                   var lodges = Lodge()
                   
                   lodges.name = business.value(forKey: "name") as? String
                   lodges.rating = business.value(forKey: "rating") as? Float
                   lodges.price = business.value(forKey: "price") as? String
                   let distanceInMeters = business.value(forKey: "distance") as? Double
                   let distanceInMiles = String(format: "%.2f", (distanceInMeters!*0.000621371)) + " Miles"
                   lodges.distance = distanceInMiles
                   let address = business.value(forKey: "location.display_address") as? [String]
                   lodges.address = address?.joined(separator: "\n")
                   
                  // lodges.url = business.value(forKey: "url") as? String
                       
                   lodgesList.append(lodges)
                   }
                   
                   completionHandler(lodgesList, nil)
                   
               } catch {
                   print("caught error")
                   completionHandler(nil, error)
                   }
                   }.resume()
    }

}
