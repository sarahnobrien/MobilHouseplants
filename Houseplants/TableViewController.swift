//
//  TableViewController.swift
//  Houseplants
//
//  Created by Sarah O'Brien on 11/12/20.
//

import UIKit
class TableViewController: UITableViewController {
    
    var plantStore = PlantStore()
    @IBAction func addNewItem(_ sender: UIButton){
        let newPlant = plantStore.createPlant()
        
        if let index = plantStore.allPlants.firstIndex(of: newPlant) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    @IBAction func toggleEditingMode(_ sender: UIButton){
        if isEditing{
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        }
        else{
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
     tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantStore.allPlants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let plant = plantStore.allPlants[indexPath.row]
        cell.textLabel?.text = plant.plantName
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            switch segue.identifier {
                case "viewControllerSegue"?:
                    if let row = tableView.indexPathForSelectedRow?.row {
                        let plant = plantStore.allPlants[row]
                        let viewController = segue.destination as! ViewController
                        viewController.plant = plant
                    }
            default:
                preconditionFailure("Unexpected seque identifier.")
            }
        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "viewControllerSegue", sender: self)

    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //showAlert()
        if editingStyle == .delete {
            let plant = plantStore.allPlants[indexPath.row]
            let title = "Delete \(plant.plantName) ?"
            let message = "Are you sure you would like to delete this plant?"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
            handler: { (action) -> Void in
                self.plantStore.removePlant(plant)
           tableView.deleteRows(at: [indexPath], with: .fade)
       })
            ac.addAction(deleteAction)
            present(ac, animated: true, completion: nil)
            
        }
    }
}
