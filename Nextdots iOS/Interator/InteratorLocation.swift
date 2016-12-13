//
//  InteratorLocation.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/11/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import MapKit

protocol LocationDelegate : class {
    func didUpdateLocationStoped(center : CLLocationCoordinate2D)
}

struct Typealiases {
    typealias JSONDict = [String:Any]
}

class Location : NSObject{
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    let geoCoder = CLGeocoder()
    var stopUpdatingAfterReceived : Bool = true
    weak var delegate : LocationDelegate?
    
    static let singleton : Location = Location()
    
    func getAddress(completion: @escaping (Typealiases.JSONDict?) -> ()) {
        if let currentLocation = locationManager.location, isAuthorizationGranted(){
            self.currentLocation = currentLocation
//            print("getAddress \(currentLocation)")
            geoCoder.reverseGeocodeLocation(currentLocation) { (placemarks, error) -> Void in
                
                if error != nil {
                    print("Error getting location: \(error)")
                } else {
                    let placeArray = placemarks as [CLPlacemark]!
                    var placeMark: CLPlacemark!
                    placeMark = placeArray?[0]
                    completion(placeMark.addressDictionary as? Typealiases.JSONDict)
                }
            }
        }
    }
    
    func startUpdating(){
        if isAuthorizationGranted(){
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func isAuthorizationGranted() -> Bool{
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            return true
        }
        
        return false
    }
}

extension Location : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last, stopUpdatingAfterReceived{
            locationManager.stopUpdatingLocation()
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            delegate?.didUpdateLocationStoped(center: center)
        }
    }
}
