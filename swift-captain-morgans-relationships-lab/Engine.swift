//
//  Engine.swift
//  
//
//  Created by Flatiron School on 7/18/16.
//
//

import Foundation
import CoreData

@objc(Engine)
class Engine: NSManagedObject {

    enum EngineType: String {
        case Sail = "Sail"
        case Gas = "Gas"
        case Electric = "Electric"
        case Solar = "Solar"
        case Oars = "Oars"
    }
    
    class func randomEngineType() -> String
    {
        let randomInt = Int(arc4random_uniform(4))
        
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
