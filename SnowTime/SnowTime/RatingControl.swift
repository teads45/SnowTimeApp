//
//  RatingControl.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/18/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
//
 import UIKit
 import CoreLocation
 class viewControllerTwo: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
     
    
     @IBOutlet weak var mainHeaderLabel: UILabel!
     @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var resetPasswordLabel: UILabel!
    @IBOutlet weak var distanceSliderLabel: UILabel!
    var locationManager = CLLocationManager()
    var switchValue: String!
    
    override func viewDidLoad() {
      super.viewDidLoad()
       //set default switch value
       switchValue = "Miles"
       pickerView.delegate = self
       pickerView.dataSource = self
       locationManager.requestWhenInUseAuthorization()

    }
//used to determine which side the switch is on
    @IBAction func distanceSlider(_ sender: UISegmentedControl) {
        switchValue = sender.titleForSegment(at: sender.selectedSegmentIndex)
        }
        
    @IBAction func continueButtonAction(_ sender: Any) {
        let yelpTableVC = yelpTableViewController()
        yelpTableVC.myCustomInit(switchValue: self.switchValue)
        self.navigationController?.pushViewController(yelpTableVC, animated: true)
    }
    
        
        
      //sets values for picker
      let filter = ["Price", "Rating", "Distance"]
    
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }
         
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return filter.count
     }
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         print (filter[row])
         return filter[row]
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
                lodges.distance = changeDistanceScale()
                    //business.value(forKey: "distance") as? String// this is where the function needs to spit out one of the switch values but they are currently "unidentified"
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
                
        

        func changeDistanceScale (distanceInMeters,segment: UISegmentedControl) {
        let KmString = " Km"
        let meterToKmConversion = 10.0
        let milesString = " Miles"
        let meterToMileConversion = 0.000621371
        let distanceValueMiles = distanceInMeters * meterToMileConversion
        let distanceValueKm = distanceInMeters * meterToKmConversion
               if self.switchValue == "Miles"{
                   //use miles conversion
                   let distanceStringMiles = String(format: "%.2f", distanceValueMiles) + milesString
               }
              else if self.switchValue == "Km" {
                   //use Km
                   let distanceStringKm = String (format: "%.2f", distanceValueKm) + KmString
                                  
               } else {
                   print (self.switchValue!)
               }
           }

        }
    }
