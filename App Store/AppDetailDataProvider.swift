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
    var rate: Double { get }
    
    var screenshotURLs: [URL]? { get }
    
    var description: String { get }
    
    var detail: AppDetail? { get set }
}

class AppDetailDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView?
    
    var appEntry: AppDetailDataProviderSource {
        didSet {
            guard let tableView = tableView else { return }
            
            tableView.reloadData()
        }
    }
    
    var appId: String? { return appEntry.appId }
    var isAppEntryLoaded: Bool { return appEntry.detail != nil }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDetailRow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = AppDetailRow(rawValue: indexPath.row) else { return UITableViewCell() }
        
        switch row {
        case .header:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AppDetailHeaderCell.identifier, for: indexPath) as? AppDetailHeaderCell {
                cell.configure(by: AppDetailHeaderCellData(iconURL: appEntry.iconURL,
                                                           title: appEntry.title, rate: appEntry.rate))
                return cell
            }
        case .screenshot:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AppDetailScreenshotCell.identifier, for: indexPath) as? AppDetailScreenshotCell {
                cell.configure(by: AppDetailScreenshotCellData(screenshotURLs: appEntry.screenshotURLs))
                return cell
            }
        case .description:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AppDetailDescriptionCell.identifier, for: indexPath) as? AppDetailDescriptionCell {
                cell.configure(by: AppDetailDescriptionCellData(description: appEntry.description))
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    init(source: AppDetailDataProviderSource) {
        self.appEntry = source
    }
}

