//
//  changeIntToStringData.swift
//  SnowTime
//
//  Created by Thomas Eads on 7/27/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation
extension yelpTableViewController{

func changeDataType() {
    if pickerData == 1 {
       stringDataForSortBy = "Price"
    }else{
    pickerData = 2 {
        self.stringDataForSortBy = "Distance"
    
    }else{
    pickerData = 3 {
    stringDataForSortBy = "Rating"
        }
    }
    
}
}
