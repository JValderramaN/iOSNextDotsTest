//
//  LodgingPictuesCollectionViewController.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/8/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import RealmSwift
import MBProgressHUD
import CoreLocation

class LodgingPictuesCollectionViewController: UICollectionViewController {

    let numberOfItemsPerRow : Int = 1
    var lodging : Lodging!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.register(UINib(nibName: String(describing: LodgingPicureCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: kIdentifierLodgingPicureCollectionViewCell)
        
        self.navigationItem.rightBarButtonItem?.isEnabled = !lodging.isFavorite
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveLodgingButtonTapped(_ sender: UIBarButtonItem) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        lodging.isFavorite = true
        LocalDataService.saveData(lodging) { (error) in
            self.startMonitoringLodging(lodging: self.lodging)
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func startMonitoringLodging(lodging : Lodging){
        if !CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            return
        }

        let coordinate = CLLocationCoordinate2D(latitude: lodging.latitude, longitude: lodging.longitude)
        let region = CLCircularRegion(center: coordinate, radius: 400, identifier: "\(lodging.id)")
        Location.singleton.locationManager.startMonitoring(for: region)
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lodging.picturesURL.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kIdentifierLodgingPicureCollectionViewCell, for: indexPath) as! LodgingPicureCollectionViewCell
    
        cell.setData(pictureURL: lodging.picturesURL[indexPath.item].url)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfItemsPerRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfItemsPerRow))
        return CGSize(width: size, height: size / 2)
    }
}
