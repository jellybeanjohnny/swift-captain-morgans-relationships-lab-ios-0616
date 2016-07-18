//
//  Engine.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData


class Engine: NSManagedObject {
    
    static let entityName = "Engine"
    
    enum EngineType: String {
        case Sail = "Sail"
        case Gas = "Gas"
        case Electric = "Electric"
        case Solar = "Solar"
        case Oars = "Oars"
        
//        var description: String {
//            switch self {
//            case Sail:
//                return "Sail"
//            case Gas:
//                return "Gas"
//            case Electric:
//                return "Electric"
//            case Solar:
//                return "Solar"
//            }
//        }
    }
    
//    @NSManaged var engineType: String
//    
//    @NSManaged var ship: Ship
    
//    init(context: NSManagedObjectContext,
//         engineType: String,
//         ship: Ship)
//    {
//        let entity = NSEntityDescription.entityForName(Engine.entityName, inManagedObjectContext: context)!
//        
//        super.init(entity: entity, insertIntoManagedObjectContext: context)
//        
//        self.engineType = engineType
//        
//        self.ship = ship
//    }
    
//    class func newEngine(context: NSManagedObjectContext) -> Engine
//    {
//        let newEngine = NSEntityDescription.insertNewObjectForEntityForName("Engine",
//                                                                            inManagedObjectContext: context) as! Engine
//        //        newEngine.engineType = randomEngineType()
//        
//        return Engine(context: context, engineType: newEngine.engineType, ship: )
//    }
    
    class func randomEngineType() -> String
    {
        let randomInt = Int(arc4random_uniform(5))
        
        switch (randomInt)
        {
        case 0:
            return EngineType.Sail.rawValue
        case 1:
            return EngineType.Gas.rawValue
        case 2:
            return EngineType.Electric.rawValue
        case 3:
            return EngineType.Solar.rawValue
        default:
            return EngineType.Oars.rawValue
        }
    }
}