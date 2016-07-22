//
//  ShipTableViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Matt Amerige on 7/22/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ShipTableViewController: UITableViewController {

    var ships = Set<Ship>()
    var shipsArray: [Ship] = []
    
    override func viewDidLoad() {
        shipsArray = ships.sort({ (ship1, ship2) -> Bool in
            return ship1.name > ship2.name
        })
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shipsArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("shipCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = shipsArray[indexPath.row].name
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "shipDetailSegue" {
            if let selectedRow = tableView.indexPathForSelectedRow?.row {
                let destinationVC = segue.destinationViewController as! ShipDetailViewController
                destinationVC.ship = shipsArray[selectedRow]
            }
        }
    }

    
}
