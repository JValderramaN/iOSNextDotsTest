//
//  CustomMapView.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/9/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import MapKit

protocol CustomMapViewDelegate : class{
    func calloutDidTapped(with lodging : Lodging)
}

class CustomMapView: MKMapView{
    var mightUpdateWithNewPosition : Bool = true
    weak var customMapViewDelegate : CustomMapViewDelegate?
    
    
    func calloutDidTappedAction(sender : UIButton) {
        print("calloutDidTappedAction")
        if let lodgingCallOutButton = sender as? LodgingCallOutButton, let lodging = lodgingCallOutButton.lodging{
            customMapViewDelegate?.calloutDidTapped(with: lodging)
        }
    }
    
    func addAnnotation(with lodging : Lodging, canShowDetail : Bool){
        if self.hasLodgingMapAnnotation(by: lodging.id){
           return
        }
        
        let location = CLLocation(latitude: lodging.latitude, longitude: lodging.longitude)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 5000, 5000)
        self.setRegion(coordinateRegion, animated: true)
        let lodgingMapAnnotation = LodgingMapAnnotation(lodging: lodging, canShowDetail : canShowDetail, coordinate: location.coordinate)
        
        self.addAnnotation(lodgingMapAnnotation)
    }
    
    func addAnnotations(with lodgings : [Lodging], canShowDetail : Bool){
        for lodging in lodgings {
            self.addAnnotation(with: lodging, canShowDetail : canShowDetail)
        }
    }
    
    func hasLodgingMapAnnotation(by idLodging : Int) -> Bool{
        for annotation in self.annotations as! [LodgingMapAnnotation]{
            if annotation.lodging.id == idLodging{
                return true
            }
        }
        
        return false
    }
}


extension CustomMapView : LocationDelegate{
    func didUpdateLocationStoped(center : CLLocationCoordinate2D){
        if mightUpdateWithNewPosition{
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.setRegion(region, animated: true)
        }
    }
}

extension CustomMapView: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? LodgingMapAnnotation {
            let identifier = "\(annotation.lodging.id)"
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: -5)
            if annotation.canShowDetail{
                let callOutButton = LodgingCallOutButton(type: .detailDisclosure)
                callOutButton.lodging = annotation.lodging
                callOutButton.addTarget(self, action: #selector(calloutDidTappedAction), for: .touchUpInside)
                view.rightCalloutAccessoryView = callOutButton
            }
            
            return view
        }
        return nil
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
//        mapView.showAnnotations(mapView.annotations, animated: true)
    }
}
