//
//  fetchYelpData.swift
//  SnowTime
//
//  Created by Thomas Eads on 7/7/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
 
extension yelpTableViewController {
    
    func retrieveLodges(latitude: CLLocationDegrees,
                            longitude: CLLocationDegrees,
                            category: String,
                            limit: Int,
                            sortBy: String,
                            locale: String,
                            address: String,
                            distance: String,
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
                
            let distanceValue = business.value(forKey: distance)
            let distanceString = "\(distanceValue ?? 0.0)"
            //String(format: "%0.2f", arguments:[business.value(forKey: "distance")])
                
            var lodges = Lodge()
            lodges.name = business.value(forKey: "name") as? String
            lodges.rating = business.value(forKey: "rating") as? Float
            lodges.price = business.value(forKey: "price") as? String
            lodges.distance = distanceString
          //  let distance = business.value(forKey: "distance") as? [String]
            let address = business.value(forKey: "location.display_address") as? [String]
            lodges.address = address?.joined(separator: "\n")
            //lodges.url = business.value(forKey: "url") as? String
                
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
