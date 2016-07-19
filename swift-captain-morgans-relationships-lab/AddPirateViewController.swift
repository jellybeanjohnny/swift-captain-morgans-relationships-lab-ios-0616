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
        if let text = pirateNameField.text where pirateNameField.text?.characters.count > 0
        {
            let dataStore = DataStore()
            let managedObjectContext = dataStore.managedObjectContext
            let newPirate = NSEntityDescription.insertNewObjectForEntityForName("Pirate", inManagedObjectContext: managedObjectContext) as! Pirate
            
            newPirate.name = text
            
            do
            {
                try managedObjectContext.save()
            } catch let error
            {
                print("Could not save Pirate: \(error)")
            }
            
            self.dismissViewControllerAnimated(true, completion: nil)

        }
}
    
    @IBAction func cancelButtonTapped(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
