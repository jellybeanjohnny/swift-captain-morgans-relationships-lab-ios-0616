//
//  DataStore.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

class DataStore {
    
    static let shareDataStore = DataStore()
    
    var pirates: [Pirate] = []
    
    //    typedef NS_ENUM(NSInteger, EngineType) {
    //    Sail=1,
    //    Gas,
    //    Electric,
    //    Solar
    //    };
    //    @end
    //    @implementation FISPiratesDataStore
    //    @synthesize managedObjectContext = _managedObjectContext;
    //
    //    # pragma mark - Singleton
    //
    //    + (instancetype)sharedPiratesDataStore {
    //    static FISPiratesDataStore *_sharedPiratesDataStore = nil;
    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{
    //    _sharedPiratesDataStore = [[FISPiratesDataStore alloc] init];
    //    });
    //
    //    return _sharedPiratesDataStore;
    //    }
    //
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.FlatironSchool.swift_captain_morgans_relationships_lab" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
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
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
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
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
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
    
    func fetchData()
    {
        let pirateRequest = NSFetchRequest(entityName: "Pirate")
        
        let nameSorter = NSSortDescriptor(key: "Name", ascending: true)
        
        pirateRequest.sortDescriptors = [nameSorter]
        
        do {
            
        }
        self.pirates = [self.managedObjectContext executeFetchRequest:pirateRequest error:nil];
        
        if ([self.pirates count]==0) {
            [self generateTestData];
        }
    }
    
    func fetchData ()
    {
        
        var error:NSError? = nil
        
        let messagesRequest = NSFetchRequest(entityName: "Message")
        
        let createdAtSorter = NSSortDescriptor(key: "createdAt", ascending:true)
        
        messagesRequest.sortDescriptors = [createdAtSorter]
        
        do{
            messages = try managedObjectContext.executeFetchRequest(messagesRequest) as! [Message]
        }catch let nserror1 as NSError{
            error = nserror1
            messages = []
        }
        
        if messages.count == 0 {
            generateTestData()
        }
        
        ////         perform a fetch request to fill an array property on your datastore
    }
    
    func generateTestData() {
        
        let pirateOne: Pirate = NSEntityDescription.insertNewObjectForEntityForName("Pirate", inManagedObjectContext: managedObjectContext) as! Pirate
        
        messageOne.content = "Message 1"
        messageOne.createdAt = NSDate()
        
        let messageTwo: Message = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: managedObjectContext) as! Message
        
        messageTwo.content = "Message 2"
        messageTwo.createdAt = NSDate()
        
        let messageThree: Message = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: managedObjectContext) as! Message
        
        messageThree.content = "Message 3"
        messageThree.createdAt = NSDate()
        
        saveContext()
        fetchData()
    }
}


/*
class DataStore {
 
    
    func fetchData ()
    {
        
        var error:NSError? = nil
        
        let messagesRequest = NSFetchRequest(entityName: "Message")
        
        let createdAtSorter = NSSortDescriptor(key: "createdAt", ascending:true)
        
        messagesRequest.sortDescriptors = [createdAtSorter]
        
        do{
            messages = try managedObjectContext.executeFetchRequest(messagesRequest) as! [Message]
        }catch let nserror1 as NSError{
            error = nserror1
            messages = []
        }
        
        if messages.count == 0 {
            generateTestData()
        }
        
        ////         perform a fetch request to fill an array property on your datastore
    }
    
    func generateTestData() {
        
        let messageOne: Message = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: managedObjectContext) as! Message
        
        messageOne.content = "Message 1"
        messageOne.createdAt = NSDate()
        
        let messageTwo: Message = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: managedObjectContext) as! Message
        
        messageTwo.content = "Message 2"
        messageTwo.createdAt = NSDate()
        
        let messageThree: Message = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: managedObjectContext) as! Message
        
        messageThree.content = "Message 3"
        messageThree.createdAt = NSDate()
        
        saveContext()
        fetchData()
    }


}
 */