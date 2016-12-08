//
//  NetworkDataServices.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/7/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//


import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift
import SystemConfiguration

class NetworkDataServices {
    
    static func fetchArrayData <T: Object> (url: String, authorization: String = "", type: T.Type, success:@escaping (_ result: [T]) -> Void, fail:@escaping (_ error:NSError)->Void)->Void where T:Mappable {
        print("1aca")
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization]).responseJSON { response in
            switch response.result {
            case .success:
                guard let json = response.result.value as? [String: Any],
                    let search_results = json["search_results"] as? [Any] else{
                        return
                }
                
                print("2aca")
                if let objects = Mapper<T>().mapArray(JSONObject: search_results){
                    success(Array(objects))
                }
            case .failure(let error):
                fail(error as NSError)
            }
        }
    }
    
    static func fetchData <T: Object> (url : String, authorization: String = "", type: T.Type, success:@escaping (_ result: T) -> Void, fail:@escaping (_ error:NSError)->Void)->Void where T:Mappable {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization]).responseJSON { response in
            
            switch response.result {
            case .success:
                guard let json = response.result.value as? [String: Any]
                    else{
                        return
                }
                
                if let alarms = Mapper<T>().map(JSON: json){
                    success(alarms)
                }
            case .failure(let error):
                fail(error as NSError)
            }
        }
    }
}
