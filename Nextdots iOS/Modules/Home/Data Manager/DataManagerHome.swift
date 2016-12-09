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

class DataManagerHome {
    
    var delegate : DataManagerDelegate?
    
    func fetchLodgings() {
        fetchRemoteLodgings()
    }
    
    func fetchLocalLodgings() {
        let events = LocalDataService.fetchData(Lodging.self)
        print(events)
    }
    
    func fetchRemoteLodgings() {
        NetworkDataServices.fetchRemoteData(url: "https://api.airbnb.com/v2/search_results?client_id=3092nxybyb0otqw18e8nh5nty&_limit=30", authorization: "", success:
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
