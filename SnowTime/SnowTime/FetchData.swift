//
//  FetchData.swift
//  SnowTime
//
//  Created by Thomas Eads on 7/7/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
/*
import Foundation

extension yelpTableViewController {
    
    func retrieveLodges(latitude: Double,
                        longitude: Double,
                        limit: Int,
                        sortBy: String,
                        locale: String,
                        completionHandler: @escaping ([Lodges]?, Error?) -> Void){
        
    }
    
    
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
        
        var lodgesList: [Lodges] = []
        
        
        
        completionHandler(venuesList, nil)
    } catch {
        print("caught error")
        }
    }.resume()
    }
        






    //clientID JODMOZrCpsawbhUjvwnHuA
*/
