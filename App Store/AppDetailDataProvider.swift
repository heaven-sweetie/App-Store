//
//  AppDetailDataProvider.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import UIKit

enum AppDetailRow: Int {
    case header = 0
    case screenshot = 1
    case description = 2
    
    static var allTypes: [AppDetailRow] {
        return [.header, .screenshot, .description]
    }
    
    static var count: Int {
        return allTypes.count
    }
}

protocol AppDetailDataProviderSource {
    var appId: String? { get }
    
    var iconURL: URL? { get }
    var title: String { get }
    var rateText: String { get }
    
    var screenshotURL: URL? { get }
    
    var description: String { get }
    
    var isLoaded: Bool { get }
    var detail: AppDetail? { get set }
}
