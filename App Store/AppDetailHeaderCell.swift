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
    var rate: Double
}

class AppDetailHeaderCell: UITableViewCell, Identifiable {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var ratingStarViews: [UIImageView]!
    
    func configure(by cellData: AppDetailHeaderCellData) {
        if let iconURL = cellData.iconURL {
            iconView.af_setImage(withURL: iconURL)
        }
        titleLabel.text = cellData.title
        
        configureRatingStarView(by: cellData.rate)
    }
    
    func configureRatingStarView(by rate: Double) {
        let number = floor(rate)
        let remain = rate - number
        
        for index in 0..<Int(number) {
            let ratingStarView = ratingStarViews[index]
            ratingStarView.image = #imageLiteral(resourceName: "fullStar")
        }
        if remain > 0.0 {
            let ratingStarView = ratingStarViews[Int(ceil(number))]
            ratingStarView.image = #imageLiteral(resourceName: "halfStar")
        }
    }
}
