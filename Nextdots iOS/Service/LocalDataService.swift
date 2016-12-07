//
//  LocalDataService.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/7/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import RealmSwift

class LocalDataService {
    static let realm = try! Realm()
    
    static func saveData<T>(_ data: T) {
        do {
            try realm.write {
                if let user = data as? Lodging{
                    realm.add(user, update: true)
                }
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    static func fetchData<T: Object>(_ type: T.Type) -> Results<T> {
        let data = realm.objects(type)
        return data
    }
}

