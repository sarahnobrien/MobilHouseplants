//
//  TableViewController.swift
//  Houseplants
//
//  Created by Sarah O'Brien on 11/12/20.
//

import UIKit

//consider putting a UItable view in a UITableViewCell for the categories

class plantAreas{
    var plantLocation: String?
    var plants: [String?: String?]
    //var lastWatered: String?
    
    init(plantLocation: String?, plants: [String?: String?]){
        self.plantLocation = plantLocation
        self.plants = plants
        //self.lastWatered = lastWatered
         }
}

var plantIndex = 0
var plantLoc  = [plantAreas]()
class TableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        plantLoc.append(plantAreas.init(plantLocation: "Kitchen", plants: ["Thai Basil" : "10/30/2020", "Italian Parsley": "10/30/2020"]))
        
        plantLoc.append(plantAreas.init(plantLocation: "Bedroom", plants: ["Purple Oxalis": "11/30/2020", "Golden Pothos": "11/30/2020"]))
        
        plantLoc.append(plantAreas.init(plantLocation: "Living Room", plants: ["Neon Pothos": "11/1/2020", "Monstera Adonsonaii": "11/1/2020"]))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return plantLoc.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantLoc[section].plants.count ?? 0 //0 is default if nothing in the section
        //return plants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = plantLoc[indexPath.section].plants?[indexPath.row]
        //cell.textLabel?.text = plants[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return plantLoc[section].plantLocation
    }
    
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        plantIndex = indexPath.row
        performSegue(withIdentifier: "viewControllerSegue", sender: self)
        
        
//        navigationController?.pushViewController(ViewController(), animated: true)
        
//        performSegue(withIdentifier: "segue", sender: self)
    }
    

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
//    func showAlert() {
//        let alert = UIAlertController(title: "Delete", message: "Are you sure you would like to delete this entry?", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in
//            print("cancelled")
//        }))
//        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {action in
//            print("deleted")
//        }))
//        present(alert, animated: true)
//    }
   // Override to support editing the table view.
   
    // MARK: - DELETE PORTION COME BACK ASFJHBG.
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        //showAlert()
//
//        if editingStyle == .delete {
//            //Delete the row from the data source
//            plants.remove(at: indexPath.row)
//           tableView.deleteRows(at: [indexPath], with: .fade)
//       } else if editingStyle == .insert {
//            //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//       }
//   }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
