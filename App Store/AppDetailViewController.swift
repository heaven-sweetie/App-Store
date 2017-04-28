//
//  AppDetailViewController.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import UIKit

class AppDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let api = API()
    var appEntry: AppDetailDataProviderSource!
    
    func loadAppDetailIfNeeded() {
        guard let appID = appEntry.appId, !appEntry.isLoaded else {
            return
        }
        
        api.requestAppDetail(by: appID) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let appDetail):
                strongSelf.appEntry.detail = appDetail
                strongSelf.tableView.reloadData()
            case .failure(let error):
                debugPrint("Error: \(error)")
            }
        }
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureTableView()
        loadAppDetailIfNeeded()
    }
}

extension AppDetailViewController: UITableViewDataSource {
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
}
