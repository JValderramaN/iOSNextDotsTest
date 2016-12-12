//
//  DataManagerHome.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/6/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift
import CoreLocation

private let defaultLocation = "Los%20Angeles%2C%20CA"

class DataManagerHome {
    
    
    var delegate : DataManagerDelegate?
    
    func fetchLodgings(favorites : Bool) {
        if favorites{
            fetchLocalLodgings()
        }else{
            fetchRemoteLodgings()
        }
    }
    
    func fetchLocalLodgings() {
        let lodgings = LocalDataService.fetchData(Lodging.self)
        self.delegate?.responseDataManager(response: lodgings)
    }
    
    func fetchRemoteLodgings() {
        var location = defaultLocation
        Location.singleton.getAddress { (result) in
            if let addressJSON = result, let city = addressJSON["City"] as? String {
                location = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
                print("fetchRemoteLodgings", city, location)
            }
            
            NetworkDataServices.fetchRemoteData(url: "https://api.airbnb.com/v2/search_results?client_id=3092nxybyb0otqw18e8nh5nty&_limit=30&location=\(location)", authorization: "", success:
                {(response) in
                    guard let json = response as? [String: Any],
                        let search_results = json["search_results"] as? [Any] else{
                            return
                    }
                    
                    if let objects = Mapper<Lodging>().mapArray(JSONObject: search_results){
                        self.delegate?.responseDataManager(response: objects)
                    }
                }, fail:{ (error) in
                    print("error \(error)")
            })
        }
    }
}
