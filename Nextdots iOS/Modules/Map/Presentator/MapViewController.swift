//
//  MapViewController.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/9/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var currentPositionMapView: CustomMapView!
    
    let goToMapLodgingDetailSegueIdentifier = "goToMapLodgingDetail"
    let interator = InteratorPreviewsLodgingTableViewController()
    var lodgings : [Lodging]?
    var lodgingSelected : Lodging?
    weak var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLodgings()
        
        self.currentPositionMapView.customMapViewDelegate = self
        self.currentPositionMapView.delegate = self.currentPositionMapView
        self.interator.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 10,
                                     target: self,
                                     selector: #selector(updateLodgings),
                                     userInfo: nil,
                                     repeats: true)            
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.timer?.invalidate()
    }
    
    func updateLodgings(){
        interator.prepareData(favorites : false)
    }
    
    func updateAnnotationsOnMap(){
        if let lodgings = self.lodgings{
            self.currentPositionMapView.addAnnotations(with: lodgings,  canShowDetail : true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MapViewController: InteratorPreviewsLodgingTableViewControllerDelegate{
    func loadLodgings(lodgings : [Lodging]?){
        self.lodgings = lodgings
        self.updateAnnotationsOnMap()
    }
}

extension MapViewController : CustomMapViewDelegate{
    func calloutDidTapped(with lodging: Lodging) {
        self.lodgingSelected = lodging
        self.performSegue(withIdentifier: self.goToMapLodgingDetailSegueIdentifier, sender: self)
        print(lodging.publicAddress)
    }
}
