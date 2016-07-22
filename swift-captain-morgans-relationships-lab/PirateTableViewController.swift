//
//  PirateTableViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Matt Amerige on 7/22/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PirateTableViewController: UITableViewController {

    let dataStore = DataStore.sharedDataStore
    var pirates: [Pirate] = []
    
    override func viewDidLoad() {
        dataStore.fetchData()
        pirates = dataStore.pirates
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pirates.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pirateCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = pirates[indexPath.row].name
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "shipsSegue" {
            if let selectedRow = tableView.indexPathForSelectedRow?.row, let ships = pirates[selectedRow].ships {
                let destinationVC = segue.destinationViewController as! ShipTableViewController
                destinationVC.ships = ships
            }
        }
    }

}
