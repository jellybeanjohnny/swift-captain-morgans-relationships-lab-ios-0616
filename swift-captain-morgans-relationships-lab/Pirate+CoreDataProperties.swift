//
//  Pirate+CoreDataProperties.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Matt Amerige on 7/22/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Pirate {

    @NSManaged var name: String?
    @NSManaged var ships: Set<Ship>?

}
