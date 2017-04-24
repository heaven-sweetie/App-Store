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
        guard let appId = id.attributes["im:id"] as? String else { return nil }
        
        return appId
    }
    
    var iconURL: URL? {
        var iconURL: URL? = nil
        if let image = image.last, let urlString = image.label {
            iconURL = URL(string: urlString)
        }
        
        return iconURL
    }
    
    var rateText: String {
        return "\(detail?.averageUserRatingForCurrentVersion ?? 0.0)"
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
