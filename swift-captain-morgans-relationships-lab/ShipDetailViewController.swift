//
//  ShipDetailViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class ShipDetailViewController: UIViewController {
    
    let store = DataStore.shareDataStore
    
    var ship: Ship?
    
    @IBOutlet weak var shipNameLabel: UILabel!
    
    @IBOutlet weak var pirateNameLabel: UILabel!
    
    @IBOutlet weak var propulsionTypeLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        shipNameLabel.text = ship?.name
        pirateNameLabel.text = ship?.pirate.name
        propulsionTypeLabel.text = ship?.engine.engineType
    }
    
}
