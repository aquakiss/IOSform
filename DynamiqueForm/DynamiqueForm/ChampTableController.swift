//
//  ChampTableController.swift
//  DynamiqueForm
//
//  Created by Developer on 24/03/2017.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class ChampTableController: UITableViewController {

    var arrayCell: [Int : ChampViewCell] = [:]
    var champs = [Champ]()
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return champs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (champs[indexPath.row].typeC?.label == "Numero") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "champCellNumber", for: indexPath) as! ChampViewCell
            print("test number")
            
            cell.label.text = champs[indexPath.row].label
            cell.textField.text = champs[indexPath.row].value
            
            arrayCell[arrayCell.count] = cell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "champCell", for: indexPath) as! ChampViewCell
            
            print("test text")
            
            cell.label.text = champs[indexPath.row].label
            cell.textField.text = champs[indexPath.row].value
            
            arrayCell[arrayCell.count] = cell
            
            return cell
        }

        
    }

    @IBAction func updateForm(_ sender: AnyObject) {
        let context = appDel.persistentContainer.viewContext

        for (cellkey ,cellvalu) in self.arrayCell {
            print(" \(cellkey) : \(cellvalu.label.text) \(cellvalu.textField.text)")
            champs[cellkey].value = cellvalu.textField.text
            print(champs[cellkey])
        }
        
        try? context.save()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
