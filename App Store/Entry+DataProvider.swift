//
//  Entry+DataProvider.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation

extension Entry: AppDetailDataProviderSource {
    var appId: String? {
        return id.attributes["im:id"] as? String ?? nil
    }
    
    var iconURL: URL? {
        guard let urlString = image.last?.label else { return nil }
        
        return URL(string: urlString)
    }
    
    var rate: Double {
        return detail?.averageUserRating ?? 0.0
    }
    
    var screenshotURLs: [URL]? {
        return detail?.screenshotUrls
    }
    
    var description: String {
        return detail?.description ?? ""
    }
    
    var isLoaded: Bool {
        return detail != nil
    }
}
