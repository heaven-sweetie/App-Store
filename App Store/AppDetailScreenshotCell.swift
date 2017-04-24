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
        guard let imageURLs = imageURLs else { return UICollectionViewCell() }
        
        if let screenshotCell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotCell.identifier, for: indexPath) as? ScreenshotCell {
            let url = imageURLs[indexPath.row]
            screenshotCell.imageView.af_setImage(withURL: url)
            return screenshotCell
        }
        
        return UICollectionViewCell()
    }    
}
