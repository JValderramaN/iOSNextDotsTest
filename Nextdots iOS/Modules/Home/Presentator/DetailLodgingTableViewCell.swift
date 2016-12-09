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
let kDetailLodgingTableViewCellHeight = CGFloat(1050)

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
        self.descriptionTextView.layer.addBorder(edge: .left, color: UIColor.lightGray, thickness: 3)
        self.descriptionTextView.flashScrollIndicators()
        self.locationMapView.layer.borderWidth = 1
        self.locationMapView.layer.borderColor = UIColor.lightGray.cgColor
        self.locationMapView.layer.cornerRadius = 3        
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
        self.descriptionTextView.scrollRangeToVisible(NSRange(location: 0,length: 0))
        self.scrimColorView.backgroundColor = UIColor.hexStringToUIColor(hex: lodging.scrimColor)
        self.publicAddressLabel.text = lodging.publicAddress
        self.starsView.rating = lodging.starRating
        //mapa
        let location = CLLocation(latitude: lodging.latitude, longitude: lodging.longitude)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000)
        self.locationMapView.setRegion(coordinateRegion, animated: true)
        
        let lodgingMapPin = LodgingMapPin(title: "\(lodging.listingCurrency) \(lodging.nightlyPrice)", coordinate: location.coordinate)
        self.locationMapView.addAnnotation(lodgingMapPin)
        self.locationMapView.showAnnotations(self.locationMapView.annotations, animated: false)
        print("4...")
    }
}

extension DetailLodgingTableViewCell: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? LodgingMapPin {
            let identifier = "pin"
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                view.setSelected(true, animated: false)
                print("1...")
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
//        views.last?.snapshotView(afterScreenUpdates: false).
        print("2...")
        views.last?.setSelected(true, animated: false)
        views.last?.setNeedsDisplay()
        mapView.selectAnnotation(mapView.annotations.last!, animated: true)
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("3...")
    }
}
