//
//  AddShipViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddShipViewController: UIViewController {
    
    @IBOutlet weak var shipNameField: UITextField!
    @IBOutlet weak var engineTypeField: UITextField!
    
    var pirate: Pirate!
    let dataStore = DataStore.shareDataStore
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        guard let shipName = shipNameField.text where shipName.characters.count > 0 else { print("Ship name too short"); return }
        guard let engineName = engineTypeField.text where engineName.characters.count > 0 else { print("Engine name too short."); return }
        
        createShip(shipName: shipName, engineName: engineName)
    
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

// MARK: Create new Ship for Pirate
extension AddShipViewController {
    
    private func createShip(shipName ship: String, engineName engine: String) {
        let managedObjectContext = dataStore.managedObjectContext
        let newShip: Ship = NSEntityDescription.insertNewObjectForEntityForName("Ship", inManagedObjectContext: managedObjectContext) as! Ship
        
        newShip.name = ship
        newShip.engine = NSEntityDescription.insertNewObjectForEntityForName("Engine", inManagedObjectContext: managedObjectContext) as! Engine
        newShip.engine.engineType = engine
        
        pirate.ships.insert(newShip)
        
        do {
            try managedObjectContext.save()
            print("Save wokred.")
        } catch let error {
            print("Jim sunk your ship: \(error)")
        }

        
    }
    
    
}
