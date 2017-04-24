//
//  AppDetailDescriptionCell.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import UIKit

struct AppDetailDescriptionCellData {
    var description: String
}

class AppDetailDescriptionCell: UITableViewCell, Identifiable {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(by cellData: AppDetailDescriptionCellData) {
        descriptionLabel.text = cellData.description
    }
}
