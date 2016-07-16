//
//  Ship.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

class Ship: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var engine: Engine
    @NSManaged var pirate: Pirate
    
    
}