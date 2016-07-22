//
//  DataStore.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

class DataStore {
    
    
    static let sharedDataStore = DataStore()
    
    var pirates: [Pirate] = []
    
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    func fetchData () {
        let fetchRequest = NSFetchRequest(entityName: Pirate.entityName)
        
        do {
           pirates = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Pirate]
        }
        catch {
            print(error)
        }
        
        if pirates.isEmpty {
            generateTestData()
        }
        
    }

    
    // MARK: - Core Data stack
    // Managed Object Context property getter. This is where we've dropped our "boilerplate" code.
    // If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("swift_captain_morgans_relationships_lab", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite") // change this?
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    //MARK: Application's Documents directory
    // Returns the URL to the application's Documents directory.
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.FlatironSchool.SlapChat" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    func generateTestData() {
        let pirate1 = NSEntityDescription.insertNewObjectForEntityForName(Pirate.entityName, inManagedObjectContext: managedObjectContext) as! Pirate
        
        let ship1 = NSEntityDescription.insertNewObjectForEntityForName(Ship.entityName, inManagedObjectContext: managedObjectContext) as! Ship
        let ship2 = NSEntityDescription.insertNewObjectForEntityForName(Ship.entityName, inManagedObjectContext: managedObjectContext) as! Ship
        
        let engine1 = NSEntityDescription.insertNewObjectForEntityForName(Engine.entityName, inManagedObjectContext: managedObjectContext) as! Engine
        let engine2 = NSEntityDescription.insertNewObjectForEntityForName(Engine.entityName, inManagedObjectContext: managedObjectContext) as! Engine
        
        pirate1.name = "Frank"
        pirate1.ships = [ship1, ship2]
        
        ship1.name = "Boaty McBoatface"
        ship1.engine = engine1
        
        ship2.name = "Ralph The Boat"
        ship2.engine = engine2
        
        engine1.propulsionType = "By Rocket"
        engine2.propulsionType = "By Dark Matter"
        
        saveContext()
        fetchData()
    }
    

}