//
//  User.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/4/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import RealmSwift
import FacebookCore

struct MyProfileRequest: GraphRequestProtocol {
    struct Response: GraphResponseProtocol {
        init(rawResponse: Any?) {
            // Decode JSON from rawResponse into other properties here.
        }
    }
    
    var graphPath = "/me"
    var parameters: [String : Any]? = ["fields": "id, name"]
    var accessToken = AccessToken.current
    var httpMethod: GraphRequestHTTPMethod = .GET
    var apiVersion: GraphAPIVersion = .defaultVersion
}

class User: Object {
    
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var imageURL: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

