//
//  MapsScreen.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/19/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class lodgesMapPage : UIViewController, MKMapViewDelegate {
    
    
    //MARK: Properties
   // @IBOutlet var mapsSpecificationLabel: UILabel!
    @IBOutlet weak var matchingLodgesShown: UILabel!
    
    @IBOutlet weak var lodgesMap: MKMapView!
    
   
    @IBOutlet weak var goBackButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let skiLodge = CLLocation(latitude: 40.7608, longitude: 111.8910)
        let regionRadius: CLLocationDistance = 1000.0
        let region = MKCoordinateRegion(center: skiLodge.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        lodgesMap.setRegion(region, animated: false)
        lodgesMap.delegate = self
        
    }
    
    
    
    //Thread 1: Exception: "[<UIViewController 0x7fed95c0d680> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key lodgesMap."
    
    
    /*
//see if the device can handle maps properly (check if device has hardware to support)
    class func significantLocationChangeMonitoringAvailable() -> Bool{
        if  = true{
            //tell maps it works
        } else {
            print("cannot use location services")
            
        }
            
    }
    //sets up the maps class if devices supports them.
    class MKMapView:UIView{
        var regiion:MKCoordinateRegion { get set }
    }
        
        */
    
}
extension MKMapView: MKMapViewDelegate{
    public func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("Map rendering...")
    }
}
