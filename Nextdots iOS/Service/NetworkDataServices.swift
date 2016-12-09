//
//  NetworkDataServices.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/7/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//


import Foundation
import Alamofire

class NetworkDataServices {
    
    static func fetchRemoteData(url: String, authorization: String = "", success:@escaping (_ response: Any) -> Void, fail:@escaping (_ error:NSError)->Void) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization]).responseJSON { response in
            switch response.result {
            case .success:
                success(response.result.value)
            case .failure(let error):
                fail(error as NSError)
            }
        }
    }
}
