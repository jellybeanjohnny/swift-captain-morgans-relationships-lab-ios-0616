//
//  Pirate.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

class Pirate: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var ships: Set<Ship>
    
    func addShipsObject(value: Ship) {
        
    }
    
    func removeShipObject(value: Ship) {
        
    }
    
    func addShips(values: Set) {
        
    }
    
    func removeShips(values: Set) {
        
    }
}