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
        return appEntry(at: index)?.title ?? ""
    }
    
    func iconURL(at index: Int) -> URL? {
        guard let iconURLString = appEntry(at: index)?.image.last?.label else { return nil }
        
        return URL(string: iconURLString)
    }
}
