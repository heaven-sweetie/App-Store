//
//  ViewController.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import UIKit

class AppEntryListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let api = API()
    var dataProvider: AppEntryListDataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataProvider()
        loadFeed()
    }
    
    func configureDataProvider() {
        dataProvider = AppEntryListDataProvider()
        dataProvider.tableView = tableView
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }
    
    func loadFeed() {
        api.requestTopFreeApps { result in
            switch result {
            case .success(let value):
                self.dataProvider.feed = value
            case .failure(let error):
                debugPrint("Error: \(error)")
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "AppDetailSegue",
            let detailViewController = segue.destination as? AppDetailViewController,
            let selectedAppEntry = dataProvider.selectedAppEntry else { return }
        
        detailViewController.appEntry = selectedAppEntry
    }
}
