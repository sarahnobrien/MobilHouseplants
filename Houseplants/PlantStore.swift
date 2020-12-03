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
        do{
            let data = try Data(contentsOf: plantArchiveURL)
            if let archivedPlants = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Houseplant] {
                allPlants = archivedPlants
            }
            }catch {
                allPlants = []
        }
    }
    
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
    func saveChanges() -> Bool {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: allPlants, requiringSecureCoding: false)
            try data.write(to: plantArchiveURL)
                return true
            } catch {
                return false
                }
                
            }
}
