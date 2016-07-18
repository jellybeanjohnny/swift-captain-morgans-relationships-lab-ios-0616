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
    
    let CellIdentifier  = "pirateCell"
      
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        
        let store = DataStore.shareDataStore
        
        store.fetchData()
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataStore.pirates.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath)
        
        let pirates = Array(dataStore.pirates)
        
        let currentPirate = pirates[indexPath.row]
        
        cell.textLabel?.text = currentPirate.name
        
        cell.detailTextLabel?.text = String.init(format: "%lu", currentPirate.ships.count)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier != "shipsSegue"
        {
            return
        }
            
        let nextVC = segue.destinationViewController as! ShipsViewController
        
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        
        let selectedPirate = dataStore.pirates[selectedIndexPath.row]
        
        nextVC.pirate = selectedPirate
    }
    
}
