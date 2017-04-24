//
//  ViewController.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import UIKit

class AppListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let api = API()
    var dataProvider: AppEntryDataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataProvider()
        api.requestTopFreeApps { self.dataProvider.feed = $0 }
    }
    
    func configureDataProvider() {
        dataProvider = AppEntryDataProvider()
        dataProvider.tableView = tableView
        
        tableView.dataSource = dataProvider
    }
}
