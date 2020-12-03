//
//  Houseplant.swift
//  Houseplants
//
//  Created by Sarah O'Brien on 12/1/20.
//

import UIKit

class Houseplant: NSObject, NSCoding, Codable{
    
    var plantLocation: String
    var plantName: String
    var lastWatered: String
    
    init(plantLocation: String, plantName: String, lastWatered: String){
        self.plantLocation = plantLocation
        self.plantName = plantName
        self.lastWatered = lastWatered

         }
    
    
    convenience init(random: Bool = false) {
     if random {
        let newPlant = ["Purple Oxalis", "Monstera Deliciosa", "Thai Basil", "Golden Pothos", "Thanksgiving Cactus"]
        let newLocation = ["Kitchen", "Bedroom", "Living Room"]
        let newWatered = ["11/20/2020", "11/4/2020", "12/1/2020"]

        var idx = arc4random_uniform(UInt32(newPlant.count))
        let randomPlant = newPlant[Int(idx)]

        idx = arc4random_uniform(UInt32(newLocation.count))
        let randomLocation = newLocation[Int(idx)]

        idx = arc4random_uniform(UInt32(newWatered.count))
        let randomWatered = newWatered[Int(idx)]

        self.init(plantLocation: randomLocation, plantName: randomPlant, lastWatered: randomWatered)
         }
     else {
            self.init(plantLocation: "", plantName: "", lastWatered: "")
     }
    }
    
    required init(coder aDecoder: NSCoder) {
             plantLocation = aDecoder.decodeObject(forKey: "plantLocation") as! String
             plantName = aDecoder.decodeObject(forKey: "plantName") as! String
             lastWatered = aDecoder.decodeObject(forKey: "lastWatered") as! String
             super.init()
        }
    func encode(with aCoder: NSCoder) {
             aCoder.encode(plantLocation, forKey: "plantLocation")
             aCoder.encode(plantName, forKey: "plantName")
             aCoder.encode(lastWatered, forKey: "lastWatered")
        }
}
