//
//  viewController3.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/18/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation
import UIKit

class viewController3: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var picker: UIPickerView!
    var starPickerData: [String] = [String]()
    @IBOutlet weak var pickerTwo: UIPickerView!
    var twoStarPickerData: [String] = [String]()
    @IBOutlet weak var pickerThree: UIPickerView!
    var threeStarPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            // Connect data:
            self.picker.delegate = self
            self.picker.dataSource = self
               
               // Input the data into the array
               starPickerData = ["Value", "Avg. Wait Times", "Snow Quality"]
                twoStarPickerData = ["Value", "Avg. Wait Times", "Snow Quality"]
                threeStarPickerData = ["Value", "Avg. Wait Times", "Snow Quality"]
        
           }
        
        
    
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
      }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        1
    }
        
    }
