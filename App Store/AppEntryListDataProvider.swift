//
//  AppListDataProvider.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import UIKit

protocol AppEntryListDataProviderSource {
    var numberOfRows: Int { get }
    
    func appEntry(at index: Int) -> Entry?
    
    func title(at index: Int) -> String
    func iconURL(at index: Int) -> URL?
}

class AppEntryListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView?
    
    var feed: AppEntryListDataProviderSource? {
        didSet {
            guard let tableView = tableView else { return }
            
            tableView.reloadData()
        }
    }
    
    var selectedAppEntry: Entry? {
        guard let feed = feed, let indexPath = tableView?.indexPathForSelectedRow else { return nil }
        
        return feed.appEntry(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let feed = feed else { return 0 }
        
        return feed.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let feed = feed,
            let cell = tableView.dequeueReusableCell(withIdentifier: AppEntryListCell.identifier, for: indexPath) as? AppEntryListCell else {
                return AppEntryListCell()
        }
        
        // MARK: - Ranking은 1에서부터 시작.
        cell.cellData = AppEntryListCellData(ranking: (indexPath.row + 1),
                                             iconURL: feed.iconURL(at: indexPath.row), title: feed.title(at: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
