//
//  PictureURL.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/6/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import RealmSwift

class PictureURL: Object {
    dynamic var url : String = ""
    
    convenience init(url : String){
        self.init()
        self.url = url
    }
}
