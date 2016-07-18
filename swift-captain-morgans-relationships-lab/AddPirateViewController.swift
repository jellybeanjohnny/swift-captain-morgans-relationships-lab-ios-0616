//
//  AddPirateViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddPirateViewController: UIViewController
{
    @IBOutlet weak var pirateNameField: UITextField!
    
    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        let dataStore = DataStore()
        let managedObjectContext = dataStore.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("Pirate",
                                                                  inManagedObjectContext: managedObjectContext)
        let newPirate = Pirate(entity: entityDescription!,
                               insertIntoManagedObjectContext: managedObjectContext)
        
        if let text = pirateNameField.text
        {
            newPirate.name = text
        }

        do
        {
            try managedObjectContext.save()
        }
        
        catch let error
        {
            print("Could not save Pirate: \(error)")
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
}
    
    @IBAction func cancelButtonTapped(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
