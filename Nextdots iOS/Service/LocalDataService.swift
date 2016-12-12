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
    
    static func saveData<T>(_ data: T, complation:@escaping (_ error:NSError?)->Void) {
        do {
            try realm.write {
                realm.add(data as! Object, update: true)
                complation(nil)
            }
        } catch let error as NSError {
            print(error)
            complation(error)
        }
    }
    
    static func fetchData<T: Object>(_ type: T.Type) -> Results<T> {
        let data = realm.objects(type)
        return data
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}

