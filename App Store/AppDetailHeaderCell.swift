//
//  AppDetailHeaderCell.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import UIKit

import AlamofireImage

struct AppDetailHeaderCellData {
    var iconURL: URL?
    var title: String
    var rate: String
}

class AppDetailHeaderCell: UITableViewCell, Identifiable {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    func configure(by cellData: AppDetailHeaderCellData) {
        if let iconURL = cellData.iconURL {
            iconView.af_setImage(withURL: iconURL)
        }
        titleLabel.text = cellData.title
        rateLabel.text = cellData.rate
    }
}
