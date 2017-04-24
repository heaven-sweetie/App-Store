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
    var screenshotURL: URL?
}

class AppDetailScreenshotCell: UITableViewCell, Identifiable {
    @IBOutlet weak var screenshotView: UIImageView!
    
    func configure(by cellData: AppDetailScreenshotCellData) {
        if let screenshotURL = cellData.screenshotURL {
            screenshotView.af_setImage(withURL: screenshotURL)
        }
    }
}
