//
//  ViewController.swift
//  Houseplants
//
//  Created by Sarah O'Brien on 11/12/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var wateredField: UITextField!
    @IBOutlet weak var trashDelete: UIBarButtonItem!
    
    
    var plant: Houseplant!
    var plantStore: PlantStore!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = plant.plantName
        locationField.text = plant.plantLocation
        wateredField.text = plant.lastWatered
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)

         plant.plantName = nameField.text ?? ""
         plant.plantLocation = locationField.text ?? ""
         plant.lastWatered = wateredField.text  ?? ""
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        plantStore.saveChanges()
        view.endEditing(true)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
}


