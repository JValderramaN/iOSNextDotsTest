//
//  PrototypePreviewLodgingTableViewCell.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/6/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

let IdentifierPrototypePreviewLodgingTableViewCell = "PrototypePreviewLodgingTableViewCell"
//"IdentifierPrototypePreviewLodgingTableViewCell"

class PrototypePreviewLodgingTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var starsView: CosmosView!
    
    let interator = InteratorPreviewLodgingTableViewCell()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(lodging : Lodging){
        nameLabel.text = lodging.name
        priceLabel.text = "\(lodging.listingCurrency) \(lodging.nightlyPrice)"
        starsView.rating = Double(lodging.starRating)
        pictureImageView.kf.setImage(with: URL(string: lodging.pictureURL))
    }
}
