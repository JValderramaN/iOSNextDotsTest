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
    dynamic var latitude: Float = 0.0
    dynamic var longitude: Float = 0.0
    dynamic var starRating: Float = 0.0
    dynamic var scrimColor: String = ""
    dynamic var city: String = ""
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
        shortDescription = "A nice description"
        guests <- map["pricing_quote.guests"]
        bathrooms <- map["listing.bathrooms"]
        bedrooms <- map["listing.bedrooms"]
        beds <- map["listing.beds"]
        latitude <- map["listing.lat"]
        longitude <- map["listing.lng"]
        starRating <- map["listing.star_rating"]
        scrimColor <- map["listing.scrim_color"]
        city <- map["listing.city"]
        let pictureURLs = map["listing.picture_urls"].currentValue as! [String]
        for pictureURL in pictureURLs {
            picturesURL.append(PictureURL(url: pictureURL.replacingOccurrences(of: "=large", with: "=small")))
        }
    }
}
