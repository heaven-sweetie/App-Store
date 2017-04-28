//
//  AppDetail.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation
import Mapper

struct AppDetail: Mappable {
    let averageUserRating: Double
    let description: String
    let screenshotUrls: [URL]
    
    init(map: Mapper) throws {
        try averageUserRating = map.from(Constant.averageUserRating)
        try description = map.from(Constant.description)
        try screenshotUrls = map.from(Constant.screenshotUrls)
    }
}
