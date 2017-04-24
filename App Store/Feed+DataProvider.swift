//
//  Feed+DataProvider.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation

extension Feed: AppEntryDataProviderSource {
    var numberOfRows: Int {
        return entry.count
    }
    
    func appEntry(at index: Int) -> Entry? {
        return entry[index]
    }
    
    // MARK: - Ranking은 1에서부터 시작.
    func ranking(of appEntry: Entry?) -> Int {
        guard let appEntry = appEntry else { return 0 }

        return (entry.index { appEntry.id.label == $0.id.label } ?? 0) + 1
    }
}
