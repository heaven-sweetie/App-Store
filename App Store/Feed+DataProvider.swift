//
//  Feed+DataProvider.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation

extension Feed: AppEntryListDataProviderSource {
    var numberOfRows: Int {
        return entry.count
    }
    
    func appEntry(at index: Int) -> Entry? {
        return entry[index]
    }
    
    func title(at index: Int) -> String {
        guard let AppEntryList = appEntry(at: index) else { return "" }
        
        return AppEntryList.title
    }
    
    func iconURL(at index: Int) -> URL? {
        guard let AppEntryList = appEntry(at: index) else { return nil }
        
        var iconURL: URL? = nil
        if let image = AppEntryList.image.last, let urlString = image.label {
            iconURL = URL(string: urlString)
        }
        
        return iconURL
    }
}
