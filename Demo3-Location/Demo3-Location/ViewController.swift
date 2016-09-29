//
//  ViewController.swift
//  Demo3-Location
//
//  Created by Jack Liao on 9/28/16.
//  Copyright © 2016 MrJackL. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate{

    @IBOutlet weak var labelLocation :UILabel?
    @IBOutlet weak var labelAddress :UILabel?
    
    var locationManager :CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLocationManager()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initLocationManager(){
        
        //need register permission in the Info.plist
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 8.0, *) {
            locationManager?.requestAlwaysAuthorization()
        } else {
            // Fallback on earlier versions
        }

    }
    
    func startLocation(){
        locationManager?.startUpdatingLocation()
    }
    
    func stopLocation(){
        locationManager?.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startLocationBtnPressed(){
        startLocation()
        
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if (manager.location == nil) {
            return
        }
        
        //show location
        let latitude = manager.location?.coordinate.latitude
        let longitude = manager.location?.coordinate.longitude
        labelLocation?.text = String(format: "latitude: %.6f ,longitude: %.6f",latitude!,longitude!)
        
        
        
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placeMarks, error)-> Void
            in
            
            if (error != nil) {
                self.labelAddress?.text = "address parse error"
                return
            }
            
            if placeMarks?.count == 0{
                self.labelAddress?.text = "receive no geocoder data"
                return;
            }
            
            self.parsePlaceMark(placeMarks![0])
            
        }
    }
    
    func parsePlaceMark(placeMark: CLPlacemark?){
        
        if let tempPlaceMark = placeMark {
            
            let thoroughfare = tempPlaceMark.thoroughfare
            let subLocality = tempPlaceMark.subLocality
            let area = tempPlaceMark.administrativeArea
            let locality = tempPlaceMark.locality
            let country = tempPlaceMark.country
            
            self.labelAddress?.text = country! + area! + locality! + subLocality! + thoroughfare!
            
        }
        
    }

}

