//
//  AppEntryListCell.swift
//  AppStore
//
//  Created by ParkSunJae on 2017. 4. 23..
//  Copyright © 2017년 heaven. All rights reserved.
//

import UIKit
import AlamofireImage

struct AppEntryListCellData {
    var ranking: Int
    var iconURL: URL?
    var title: String
}

class AppEntryListCell: UITableViewCell {
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    public static var identifier: String { return String(describing: self) }
    
    func configure(by cellData: AppEntryListCellData) {
        rankingLabel.text = "\(cellData.ranking)"
        if let iconURL = cellData.iconURL {
            iconImageView.af_setImage(withURL: iconURL)
        }
        titleLabel.text = cellData.title
    }
}
