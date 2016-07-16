

# Captain Morgans Relationships

## Instructions

  1. Navigate to the `objcCMR.xcdatamodeld`.
  2. Create three entities with attributes and relationships: Pirate, Ship, Engine.
    * Pirates have many ships, and a name.
    * Ships have one Pirate, one Engine, and a name.
    * Engines have an `NSString` attribute describing its propulsion type (i.e. sail, gas, or electric) and one ship. 
  3. In your dataStore, write the implementation for `generateTestData` and `fetchData`.  
  8. Make sure everything shows up!

## Advanced

1. Add two plus `UIBarButtonItems`. One on `FISPiratesViewController` and one on `FISShipsViewController`. When you click the plus it should modally present a new view controller that allows the user to add a either new pirate, or a new ship (which needs an engine and should be associated with a pirate!) to the database.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/objc-captain-morgans-relationships' title='Captain Morgans Relationships'>Captain Morgans Relationships</a> on Learn.co and start learning to code for free.</p>
