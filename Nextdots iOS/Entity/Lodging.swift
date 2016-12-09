//
//  Lodging.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/6/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Lodging: Object {
    
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var pictureURL: String = ""
    dynamic var nightlyPrice: Float = 0.0
    dynamic var listingCurrency: String = ""
    dynamic var propertyType: String = ""
    dynamic var roomType: String = ""
    dynamic var publicAddress: String = ""
    dynamic var shortDescription: String = ""
    dynamic var guests: Int = 0
    dynamic var bathrooms: Int = 0
    dynamic var bedrooms: Int = 0
    dynamic var beds: Int = 0
    dynamic var latitude: Double = 0.0
    dynamic var longitude: Double = 0.0
    dynamic var starRating: Double = 0.0
    dynamic var scrimColor: String = ""
    var picturesURL = List<PictureURL>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension Lodging : Mappable {
    func mapping(map: Map) {
        id <- map["listing.id"]
        name <- map["listing.name"]
        pictureURL <- map["listing.picture_url"]
        nightlyPrice <- map["pricing_quote.nightly_price"]
        listingCurrency <- map["pricing_quote.listing_currency"]
        propertyType <- map["listing.property_type"]
        roomType <- map["listing.room_type"]
        publicAddress <- map["listing.public_address"]
        guests <- map["pricing_quote.guests"]
        bathrooms <- map["listing.bathrooms"]
        bedrooms <- map["listing.bedrooms"]
        beds <- map["listing.beds"]
        latitude <- map["listing.lat"]
        longitude <- map["listing.lng"]
        starRating <- map["listing.star_rating"]
        scrimColor <- map["listing.scrim_color"]
        
        let pictureURLs = map["listing.picture_urls"].currentValue as! [String]
        for pictureURL in pictureURLs {
            picturesURL.append(PictureURL(url: pictureURL))
        }
        
//        print("1aca")
        NetworkDataServices.fetchRemoteData(url: "https://api.airbnb.com/v2/listings/\(id)?client_id=3092nxybyb0otqw18e8nh5nty&_format=v1_legacy_for_p3", authorization: "", success:
            {(response) in
                guard let json = response as? [String: Any],
                    let listing = json["listing"] as? [String: Any] else{
                        return
                }
                
                self.shortDescription = listing["description"] as! String
                
//                print("2aca")
            }, fail:{ (error) in
                print("error \(error)")
        })
    }
}
