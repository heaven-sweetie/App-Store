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
    var dataProvider: AppDetailDataProvider?
    
    func loadAppDetailIfNeeded() {
        guard let dataProvider = dataProvider, !dataProvider.isAppEntryLoaded, let appId = dataProvider.appId else { return }
        
        api.requestAppDetail(by: appId) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let appDetail):
                strongSelf.dataProvider?.appEntry.detail = appDetail
                strongSelf.tableView.reloadData()
            case .failure(let error):
                debugPrint("Error: \(error)")
            }
        }
    }
    
    func configureDataProvider() {
        dataProvider?.tableView = tableView
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureTableView()
        configureDataProvider()
        loadAppDetailIfNeeded()
    }
}
