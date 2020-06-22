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
import CoreLocation

class lodgesMapPage : UIViewController, MKMapViewDelegate {
    
    //MARK: Properties
   // @IBOutlet var mapsSpecificationLabel: UILabel!
    @IBOutlet weak var matchingLodgesShown: UILabel!
    
    @IBOutlet weak var lodgesMap: MKMapView!
   
    @IBOutlet weak var goBackButton: UIButton!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
           currentLoc = locationManager.location
        }
        
        let skiLodge = CLLocation(latitude: currentLoc.coordinate.latitude , longitude: currentLoc.coordinate.longitude)
        let regionRadius: CLLocationDistance = 1000000.0
        let region = MKCoordinateRegion(center: skiLodge.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        lodgesMap.setRegion(region, animated: false)
        lodgesMap.delegate = self
    }
}
    extension MKMapView: MKMapViewDelegate{
    public func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("Map rendering...")
        }
}
