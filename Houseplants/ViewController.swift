//
//  ViewController.swift
//  Houseplants
//
//  Created by Sarah O'Brien on 11/12/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var plantLocations: UILabel!
    @IBOutlet weak var waterDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plantName.text = plants[plantIndex]
        plantLocations.text = plantLocation[plantIndex]
        waterDate.text = lastWatered[plantIndex]
        
    }


}

