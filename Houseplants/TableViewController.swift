//
//  TableViewController.swift
//  Houseplants
//
//  Created by Sarah O'Brien on 11/12/20.
//

import UIKit
class TableViewController: UITableViewController {
    
    var plantStore: PlantStore!
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }

    @IBAction func addNewItem(_ sender: UIButton){
        let newPlant = plantStore.createPlant()
        
        if let index = plantStore.allPlants.firstIndex(of: newPlant) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        //plantStore.saveChanges()
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
        //plantStore.saveChanges()
    }
    
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
     tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Houseplant.saveHouseplantsToUserDefaults(plants: plantStore.allPlants)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // old return plantLoc.count
//        return 3
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //old  return plantLoc[section].plants.count ?? 0 //0 is default if nothing in the section
        return plantStore.allPlants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //locationIndex = indexPath.section
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let plant = plantStore.allPlants[indexPath.row]
        cell.textLabel?.text = plant.plantName
    //old    cell.textLabel?.text = plantLoc[indexPath.section].plants[indexPath.row]
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        //locationIndex = plantLoc[indexPath.section].plantLocation
//    //old    return plantLoc[section].plantLocation
//        let plantLocations = plantStore[section]
//        //allPlants.plantLocation
//        return plantLocations
//    }
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
    
   
    // MARK: - DELETE PORTION COME BACK ASFJHBG. get so alert pops
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //showAlert()
        if editingStyle == .delete {
            let plant = plantStore.allPlants[indexPath.row]
            let title = "Delete \(plant.plantName!) ?"
            let message = "Are you sure you would like to delete this plant?"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
            handler: { (action) -> Void in
                self.plantStore.removePlant(plant)
            //plantLoc[indexPath.section].plants[indexPath.row]
     //old       plantLoc[indexPath.section].plants.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .fade)
       })
            ac.addAction(deleteAction)
            present(ac, animated: true, completion: nil)
//        else if editingStyle == .insert {
//            //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//       }
   }
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

 
}
