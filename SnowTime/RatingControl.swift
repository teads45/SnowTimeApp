//
//  RatingControl.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/18/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
 import UIKit
 import CoreLocation
 class viewControllerTwo: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
     
     @IBOutlet weak var mainHeaderLabel: UILabel!
       
     
     @IBOutlet weak var goToYelp: UIButton!
       
     
     @IBOutlet weak var pickerView: UIPickerView!
     
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

    
 // testing location services
 var locationManager = CLLocationManager()
     
 override func viewDidLoad() {
   super.viewDidLoad()
     pickerView.delegate = self
     pickerView.dataSource = self
     locationManager.requestWhenInUseAuthorization()

     }
 }
