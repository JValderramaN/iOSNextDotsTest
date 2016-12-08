//
//  PreviewLodgingTableViewCell.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/6/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

let kIdentifierPreviewLodgingTableViewCell = "PreviewLodgingTableViewCell"
let kPreviewLodgingTableViewCellHeight = CGFloat(250)

class PreviewLodgingTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var starsView: CosmosView!
    var lodging : Lodging?    
    
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
        self.nameLabel.text = lodging.name
        self.priceLabel.text = "\(lodging.listingCurrency) \(lodging.nightlyPrice)"
        self.typeLabel.text = lodging.propertyType
        self.starsView.rating = lodging.starRating
        self.pictureImageView.kf.setImage(with: URL(string: lodging.pictureURL))
    }
}
