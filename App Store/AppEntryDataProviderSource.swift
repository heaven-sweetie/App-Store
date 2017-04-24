//
//  AppListDataProvider.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import UIKit

protocol AppEntryDataProviderSource {
    var numberOfRows: Int { get }
    func appEntry(at index: Int) -> Entry?
    func ranking(of appEntry: Entry?) -> Int
}

class AppEntryDataProvider: NSObject, UITableViewDataSource {
    var tableView: UITableView?

    var feed: AppEntryDataProviderSource? {
        didSet {
            guard let tableView = tableView else { return }
            
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let feed = feed else { return 0 }
        
        return feed.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let feed = feed, let appEntry = feed.appEntry(at: indexPath.row) else { return AppEntryCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AppEntryCell.identifier, for: indexPath) as! AppEntryCell
        
        var iconURL: URL? = nil
        if let image = appEntry.image.last, let urlString = image.label {
            iconURL = URL(string: urlString)
        }
        
        cell.configure(by: AppEntryCellData(ranking: feed.ranking(of: appEntry), iconURL: iconURL, title: appEntry.title))
        
        return cell
    }
}
