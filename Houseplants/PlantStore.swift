//
//  PlantStore.swift
//  Houseplants
//
//  Created by Sarah O'Brien on 12/1/20.
//

import UIKit

class PlantStore{
    var allPlants = [Houseplant]()
    
//    init(){
//        for _ in 0..<5{
//            createPlant()
//        }
//    }
    @discardableResult func createPlant() -> Houseplant {
         let newPlant = Houseplant(random: true)
         allPlants.append(newPlant)
         return newPlant
    }
}


