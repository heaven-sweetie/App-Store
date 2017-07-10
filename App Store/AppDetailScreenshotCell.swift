//
//  AppDetailScreenshotCell.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import UIKit
import AlamofireImage

struct AppDetailScreenshotCellData {
    var screenshotURLs: [URL]?
}

class AppDetailScreenshotCell: UITableViewCell, Identifiable {
    @IBOutlet weak var screenshotView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageURLs: [URL]?
    
    func configure(by cellData: AppDetailScreenshotCellData) {
        imageURLs = cellData.screenshotURLs
        
        collectionView.reloadData()
    }
}

extension AppDetailScreenshotCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageURLs = imageURLs,
            let screenshotCell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotCell.identifier, for: indexPath) as? ScreenshotCell
            else {
                return UICollectionViewCell()
        }
        
        screenshotCell.imageView.af_setImage(withURL: imageURLs[indexPath.row])
        
        return screenshotCell
    }
}
