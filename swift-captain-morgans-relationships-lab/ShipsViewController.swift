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
    let cellIdentifier: String = "shipCell"
    
    let pirate: Pirate = Pirate()
    
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
        return pirate.ships.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let ships = Array(pirate.ships)
        
        let currentShip = ships[indexPath.row]
        
        cell.textLabel?.text = currentShip.name
        
        cell.detailTextLabel?.text = currentShip.engine.engineType
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "shipDetailSegue"
        {
            let nextVC = segue.destinationViewController as! AddShipViewController
            
            nextVC.pirate = pirate
        }
        
        else
        {
            let nextVC = segue.destinationViewController as! ShipDetailViewController
            
            let selectedIndexPath = tableView.indexPathForSelectedRow
            
            let ships = Array(pirate.ships)
            
            nextVC.ship = ships[selectedIndexPath.row]
        }
        
        if (![segue.identifier isEqualToString:@"shipDetailSegue"]) {
            FISAddShipViewController *nextVC = segue.destinationViewController;
            nextVC.pirate = self.pirate;
        } else {
            FISShipDetailViewController *nextVC = segue.destinationViewController;
            NSIndexPath *selectedIP = [self.tableView indexPathForSelectedRow];
            NSArray *ships = [self.pirate.ships allObjects];
            nextVC.ship = ships[selectedIP.row];
        }
    }

}
