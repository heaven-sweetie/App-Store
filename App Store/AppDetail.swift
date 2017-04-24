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
    let averageUserRatingForCurrentVersion: Double
    let description: String
    let screenshotUrls: [URL]
    
    init(map: Mapper) throws {
        try averageUserRatingForCurrentVersion = map.from("averageUserRatingForCurrentVersion")
        try description = map.from("description")
        try screenshotUrls = map.from("screenshotUrls")
    }
}

func transform(_ value: Any) throws -> Date {
    guard let stringValue = value as? String else {
        throw MapperError.convertibleError(value: value, type: Date.self)
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    guard let date = dateFormatter.date(from: stringValue) else {
        throw MapperError.convertibleError(value: value, type: Date.self)
    }
    return date
}
