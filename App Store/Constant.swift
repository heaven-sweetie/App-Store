//
//  Constant.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 28..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation

struct Constant {
    static let label = "label"
    
    static let attributes = "attributes"
    static let feed = "feed"
    static let entry = "entry"
    
    static let averageUserRating = "averageUserRating"
    static let description = "description"
    static let screenshotUrls = "screenshotUrls"
    
    static let name = "im:name"
    static let image = "im:image"
    static let title = "title"
    static let id = "id"
    
    static let country = "country"
    static let countryKorea = "kr"
    
    static let itunesBase = "https://itunes.apple.com"
    static let rss = "rss"
    static let topfreeapplications = "topfreeapplications"
    static let limit = "limit"
    static let defaultInit = 50
    static let genre = "genre"
    static let financeCode = 6015
    static let json = "json"
    static let lookup = "lookup"
    
    static let results = "results"
    
    static func path(_ paths: [String]) -> String {
        return paths.joined(separator: ".")
    }
}

extension Constant {
    static let entryListDateFormat = "yyyy-MM-dd'T'HH:mm:ss-mm:ss"
    
    static let appDetailSegue = "AppDetailSegue"
}
