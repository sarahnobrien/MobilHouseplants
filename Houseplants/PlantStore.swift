//
//  PlantStore.swift
//  Houseplants
//
//  Created by Sarah O'Brien on 12/1/20.
//

import UIKit

class PlantStore {
    var allPlants = [Houseplant]()
    
    let plantArchiveURL: URL = {
            let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let documentDirectory = documentsDirectories.first!
            return documentDirectory.appendingPathComponent("plants").appendingPathExtension("plist")
        }()
    
    init() {
            if let data = try? Data(contentsOf: plantArchiveURL),
                let archivedPlants = try? PropertyListDecoder().decode(Array<Houseplant>.self, from: data) {
                allPlants = archivedPlants
            }
        }
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
    
    func removePlant(_ plant: Houseplant) {
        if let index = allPlants.firstIndex(of: plant) {
        allPlants.remove(at: index)
        }
    }
    func saveChanges() {
            print("Saving items to: \(plantArchiveURL.path)")
            let archivedPlants = try? PropertyListEncoder().encode(allPlants)
            
            do {
                try archivedPlants?.write(to: plantArchiveURL, options: .noFileProtection)
                print("Saved all ot the Items")
            } catch {
                print("Could not save any of the Items")
            }
        }
}
