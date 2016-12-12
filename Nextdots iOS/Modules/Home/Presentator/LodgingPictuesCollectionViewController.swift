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

class LodgingPictuesCollectionViewController: UICollectionViewController {

    let numberOfItemsPerRow : Int = 1
    var lodging : Lodging!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.register(UINib(nibName: String(describing: LodgingPicureCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: kIdentifierLodgingPicureCollectionViewCell)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveLodgingButtonTapped(_ sender: UIBarButtonItem) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        LocalDataService.saveData(lodging) { (error) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
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
