//
//  LodgingPicureCollectionViewCell.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/8/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import Kingfisher

let kIdentifierLodgingPicureCollectionViewCell = "LodgingPicureCollectionViewCell"

class LodgingPicureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureImaveView: UIImageView!
    
    func setData(pictureURL : String){
        self.pictureImaveView.kf.setImage(with: URL(string: pictureURL))
    }
}
