//
//  PiratesViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class PiratesViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var dataStore: DataStore = DataStore()
    
    var frc: NSFetchedResultsController?
    
    static let CellIdentifier  = "pirateCell"
    
    override func viewDidLoad() {
        let model = dataStore.managedObjectModel
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        dataStore.fetchData()
        tableView.reloadData()
    }
        
        
}
