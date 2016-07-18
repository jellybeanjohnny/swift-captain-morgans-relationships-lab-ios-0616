//
//  Ship.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData


final class Ship: NSManagedObject {
    
    static let entityName = "Ship"
    @NSManaged var name: String
    @NSManaged var engine: Engine
    @NSManaged var pirate: Pirate
    
    init(context: NSManagedObjectContext,
         name: String,
         engine: Engine,
         pirate: Pirate)
    {
        let entity = NSEntityDescription.entityForName(Ship.entityName, inManagedObjectContext: context)!
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.engine = engine
        self.pirate = pirate
    }
    
//    class func newShip(context: NSManagedObjectContext) -> Ship
//    {
//        let name = "Ship"
//        
//        return Ship(context: context,
//                    name: name,
//                    engine: Engine.newEngine(context),
//                    pirate: pirate)
//    }
    
//    @objc
//    private override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
//        super.init(entity: entity, insertIntoManagedObjectContext: context)
//    }
}
