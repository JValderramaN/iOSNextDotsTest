//
//  DataManagerHome.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/6/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation

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
        NetworkDataServices.fetchArrayData(url: "https://api.airbnb.com/v2/search_results?client_id=3092nxybyb0otqw18e8nh5nty&_limit=30", authorization: "", type: Lodging.self, success:
            {(objects) in
                self.delegate?.responseDataManager(response: objects)
            }, fail:{ (error) in
                print("error \(error)")
        })
    }
}
