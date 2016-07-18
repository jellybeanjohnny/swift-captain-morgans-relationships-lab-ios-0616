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
    
    var pirate = Pirate()

    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        let dataStore = DataStore()
        let managedObjectContext = dataStore.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("Ship",
                                                                  inManagedObjectContext: managedObjectContext)
        let newShip = Ship(entity: entityDescription!,
                           insertIntoManagedObjectContext: managedObjectContext)
        
        if let nameText = shipNameField.text, let engineText = engineTypeField.text
        {
            newShip.name = nameText
            newShip.engine = NSEntityDescription.insertNewObjectForEntityForName("Engine",
                                                                                 inManagedObjectContext: managedObjectContext)
            newShip.engine.engineType = engineText
        }
        
        do
        {
            try managedObjectContext.save()
        }
            
        catch let error
        {
            print("Could not save the Ship: \(error)")
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func cancelButtonTapped(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
