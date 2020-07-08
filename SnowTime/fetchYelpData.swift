//
//  fetchYelpData.swift
//  SnowTime
//
//  Created by Thomas Eads on 7/7/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation
extension yelpTableViewController {
    
func retrieveLodges(latitude: Double,
                    longitude: Double,
                    limit: Int,
                    sortBy: String,
                    locale: String,
                    category: String,
                    completionHandler: @escaping ([Lodges]?, Error?) -> Void){
    
    
    //inset api key from yelp
          let apikey = "thbwyY1lg0-9YAYhUpKYDlSgpJhJkrZQgQv1VYUJkDljgZUlw-wKU9i_nEUeNLwF01n8S4IovCt8vTWzi1iTdjdvhJemzapfWmEWLLPhdfxbu64YXMgOGFTO8IrzXnYx"

          // insert base URL for search
          let baseURL = "https://api.yelp.com/v3/businesses/search?latitude=\(latitude)&longitude=\(longitude)&categories=\(category)&limit=\(limit)&sort_by=\(sortBy)&locale=\(locale)"
    
          let url = URL(string: baseURL)
      
    
    //create request
       var request = URLRequest(url: url!)
       request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
       request.httpMethod = "GET"

    //Initialize session and task
    URLSession.shared.dataTask(with: request) { (data, response, error) in
    if let error = error {
    completionHandler(nil, error)
    }
    do {
                  //read data as JSON
                  let json = try JSONSerialization.jsonObject(with: data!, options: [])
                  
                  //main dictionary
                  guard let resp = json as? NSDictionary else { return }
                  
                  //businesses
                  guard let businesses = resp.value(forKey: "businesses") as? [NSDictionary] else { return }
                  
                  var lodgesList: [Lodges] = []
                  
                  // accessing each business
                  for business in businesses {
                      var lodge = Lodges()
                      lodge.name = business.value(forKey: "name") as? String
                      lodge.price = business.value(forKey: "price") as? String
                      lodge.rating = business.value(forKey: "rating") as? Float
                      lodge.distance = business.value(forKey: "distance") as? Double
                      let address = business.value(forKeyPath: "location.display_address") as? [String]
                      lodge.address = address?.joined(separator: "\n")
                      
                      lodgesList.append(lodge)
                  }
                  
                  completionHandler(lodgesList, nil)
              } catch {
                  print("caught error")
                  completionHandler(nil, error)
              }
              }.resume()
    }
}
