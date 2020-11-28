//
//  ViewController.swift
//  Houseplants
//
//  Created by Sarah O'Brien on 11/12/20.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet weak var plantName: UILabel?
//    @IBOutlet weak var plantLocations: UILabel?
//   // @IBOutlet weak var waterDate: UILabel!
//
    
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var plantLocation: UILabel!
    @IBOutlet weak var lastWatered: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let locations = plantLoc[plantIndex].plantLocation
        let plants = plantLoc[plantIndex].plants
        let watered = plantLoc[plantIndex].lastWatered
        
        plantName?.text = plants?[plantIndex]
        plantLocation?.text = locations
        lastWatered?.text = watered?[plantIndex]
        
        //plantName.text = plantLoc.plants[plantIndex]
        
        //plantLocations.text = plantLoc.plantLocation?
        
        //plantName.text = plants[plantIndex]
        //plantLocations.text = plantLocation[plantIndex]
        //waterDate.text = lastWatered[plantIndex]
        
       
        
    }
    


}

