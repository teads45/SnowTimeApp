//
//  yelpReview.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/24/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
 
import UIKit


class yelpTableViewController: UITableViewController{
    
    @IBOutlet weak var lodgesTableView: UITableView!
    
    //coordinates for SLC, Utah
    let CPLatitude: Double = 40.1
    let CPLongitude: Double = -111.1
    
    var lodges: [Lodges] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        lodgesTableView.delegate = self
        lodgesTableView.dataSource = self
        lodgesTableView.register(UINib(nibName:"CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
        lodgesTableView.separatorStyle = .none
    
        
        
        
        retrieveLodges(latitude: CPLatitude, longitude: CPLongitude, limit: 10, sortBy: "distance", locale: "en_US", category: "ski Lodges") { (response, error) in
            
            if let response = response {
                self.lodges = response
            
                }
            }
        }
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
            let baseURL = "https://api.yelp.com/v3/businesses/search"
            let url = URL(string: baseURL)
        
         var request = URLRequest(url:url!)
            
            request.setValue("Bearer\(apikey)", forHTTPHeaderField: "Authorization")
                request.httpMethod = "GET"



                //Initialize session and task
                URLSession.shared.dataTask(with: request) {(data, response, error)in
                if let error = error {
                    completionHandler(nil, error)
                    
                }
                
                do {
                    //read data as JSON
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    
                    //main dictionary
                    guard let resp = json as? NSDictionary else {return}
                    
                    //businesses
                    guard let businesses = resp.value(forKey: "businesses") as? [NSDictionary] else {return}
                    
                    var lodgesList: [Lodges] = []
                    
                    // accessing each business
                    for business in businesses {
                        var lodge = Lodges()
                        lodge.name = business.value(forKey: "name") as? String
                        lodge.price = business.value(forKey: "price") as? String
                        lodge.rating = business.value(forKey: "rating") as? Float
                        lodge.distance = business.value(forKey: "distance") as? Double
                        let address = business.value(forKeyPath: "location.dispay_address") as? [String]
                        lodge.address = address?.joined(separator: "\n")
                        
                        lodgesList.append(lodge)
                    }
                    
                    completionHandler(lodgesList, nil)
                } catch {
                    print("caught error")
                    }
                }.resume()
            }
        }

   





extension yelpTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> 
}
   /* func setStarNumber(_ selected: false, animated: true) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
     */
//MARK: Yelp Client ID and API KEY
/*

*/
