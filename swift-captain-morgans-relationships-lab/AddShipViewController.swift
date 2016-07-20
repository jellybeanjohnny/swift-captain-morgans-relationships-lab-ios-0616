//
//  AddShipViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddShipViewController: UIViewController
{
    @IBOutlet weak var shipNameField: UITextField!
    @IBOutlet weak var engineTypeField: UITextField!
    
    
    var pirate: Pirate!
    
    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        if let nameText = shipNameField.text, let engineText = engineTypeField.text where shipNameField.text?.characters.count > 0 && engineTypeField.text?.characters.count > 0
        {
            let dataStore = DataStore()
            let managedObjectContext = dataStore.managedObjectContext
            let newShip: Ship = NSEntityDescription.insertNewObjectForEntityForName("Ship", inManagedObjectContext: managedObjectContext) as! Ship
            
            newShip.name = nameText
            newShip.engine = NSEntityDescription.insertNewObjectForEntityForName("Engine", inManagedObjectContext: managedObjectContext) as! Engine
            newShip.engine.engineType = engineText
            
            do
            {
                try managedObjectContext.save()
            } catch let error
            {
                print("Jim sunk your ship: \(error)")
            }
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    @IBAction func cancelButtonTapped(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
