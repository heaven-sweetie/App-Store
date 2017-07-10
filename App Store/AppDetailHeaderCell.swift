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
        let integer = Int(floor(rate))
        let remain = rate - floor(rate)
        
        [0..<integer]
            .flatMap { ratingStarViews[$0] }
            .forEach { $0.image = #imageLiteral(resourceName: "fullStar") }
        
        ratingStarViews[integer].image = remain > 0.0 ? #imageLiteral(resourceName: "halfStar") : #imageLiteral(resourceName: "emptyStar")
    }
}
