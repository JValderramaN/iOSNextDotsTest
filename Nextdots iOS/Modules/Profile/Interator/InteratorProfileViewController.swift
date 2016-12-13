//
//  InteratorProfileViewController.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/13/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import FacebookLogin
import FacebookCore
import RealmSwift
import CoreLocation

extension ProfileViewController{
    func logout(){
        logoutFromFacebook()
        removeLocalData()
        goToLogin()
    }
    
    func logoutFromFacebook(){
        let loginManager = LoginManager()
        loginManager.logOut()
    }
    
    func removeLocalData(){
        let realm = try! Realm()
        try! realm.write {
            let favoritesLodgings = LocalDataService.fetchData(Lodging.self)
            for lodging in favoritesLodgings {
                stopMonitoring(by: "\(lodging.id)")
                realm.delete(lodging)
            }
        }
    }
    
    func stopMonitoring(by lodgingID: String) {
        for region in Location.singleton.locationManager.monitoredRegions {
            guard let circularRegion = region as? CLCircularRegion, circularRegion.identifier == lodgingID else { continue }
            Location.singleton.locationManager.stopMonitoring(for: circularRegion)
        }
    }
}
