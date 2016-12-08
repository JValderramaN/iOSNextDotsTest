//
//  DetailLodgingTableViewCell.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/7/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import MapKit
import Cosmos
import Kingfisher

let kIdentifierDetailLodgingTableViewCell = "DetailLodgingTableViewCell"
let kDetailLodgingTableViewCellHeight = CGFloat(1000)

class DetailLodgingTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var propertyTypeLabel: UILabel!
    @IBOutlet weak var roomTypeLabel: UILabel!
    @IBOutlet weak var guestsLabel: UILabel!
    @IBOutlet weak var bedroomsLabel: UILabel!
    @IBOutlet weak var bedsLabel: UILabel!
    @IBOutlet weak var bathroomsLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var locationMapView: MKMapView!
    @IBOutlet weak var scrimColorView: UIView!
    @IBOutlet weak var publicAddressLabel: UILabel!
    @IBOutlet weak var starsView: CosmosView!
    
    var lodging : Lodging!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(lodging : Lodging){
        self.lodging = lodging
        self.pictureImageView.kf.setImage(with: URL(string: lodging.pictureURL))
        self.priceLabel.text = "\(lodging.listingCurrency) \(lodging.nightlyPrice)"
        self.nameLabel.text = lodging.name
        self.propertyTypeLabel.text = lodging.propertyType
        self.roomTypeLabel.text = lodging.roomType
        self.guestsLabel.text = "\(lodging.guests)"
        self.bedroomsLabel.text = "\(lodging.bedrooms)"
        self.bedsLabel.text = "\(lodging.beds)"
        self.bathroomsLabel.text = "\(lodging.bathrooms)"
        self.descriptionTextView.text = lodging.shortDescription
        self.scrimColorView.backgroundColor = UIColor.hexStringToUIColor(hex: lodging.scrimColor)
        self.publicAddressLabel.text = lodging.publicAddress
        self.starsView.rating = lodging.starRating
        //mapa
    }
}
