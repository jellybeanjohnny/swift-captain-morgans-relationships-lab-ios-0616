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
    
    static let entityName = "Pirate"
    
    @NSManaged var name: String
    
    @NSManaged var ships: Set<Ship>
    
    init(context: NSManagedObjectContext,
         name: String,
         ships: Set<Ship>)
    {
        let entity = NSEntityDescription.entityForName(Pirate.entityName, inManagedObjectContext: context)!
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        
        self.ships = ships
    }
    
    func addShipsObject(value: Ship) {
        
    }
    
    func removeShipObject(value: Ship) {
        
    }
    
    func addShips(values: Set<Ship>) {
        
    }
    
    func removeShips(values: Set<Ship>) {
        
    }
    
}


public final class Company: NSManagedObject {
    
    static public let entityName = "Company"
    
    @NSManaged public var name: String
    
    @NSManaged public var dateFounded: NSDate
    
    @NSManaged public var profits: NSDecimalNumber
    
    @NSManaged public var employees: Set<Employee>
    
    public init(context: NSManagedObjectContext,
                name: String,
                dateFounded: NSDate,
                profits: NSDecimalNumber) {
        let entity = NSEntityDescription.entityForName(Company.entityName, inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.dateFounded = dateFounded
        self.profits = profits
    }
    
    public class func newCompany(context: NSManagedObjectContext) -> Company {
        let name = "Company " + String(NSUUID().UUIDString.characters.split { $0 == "-" }.first!)
        
        return Company(context: context,
                       name: name,
                       dateFounded: NSDate.distantPast(),
                       profits: NSDecimalNumber(unsignedInt: arc4random_uniform(1_000_000)))
    }
    
    @objc
    private override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
}
