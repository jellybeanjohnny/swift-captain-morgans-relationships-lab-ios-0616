//
//  ShipsViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class ShipsViewController: UITableViewController
{
    let CellIdentifier: String = "shipCell"
    var store: DataStore = DataStore.shareDataStore
    var pirate: Pirate!
    var ships: [Ship] = [] {
        didSet {
            print("Reloading data.")
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        ships = Array(pirate.ships)
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pirate.ships.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath)
        let currentShip = ships[indexPath.row]
        cell.textLabel?.text = currentShip.name
        cell.detailTextLabel?.text = currentShip.engine.engineType
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "shipDetailSegue" {
            
            let nextVC = segue.destinationViewController as! ShipDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            nextVC.ship = ships[selectedIndexPath.row]
        } else {
            let nextVC = segue.destinationViewController as! AddShipViewController            
            nextVC.pirate = self.pirate
        }
    }
    
}
