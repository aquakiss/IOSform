//
//  CreatorForm_TableViewController.swift
//  DynamiqueForm
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import CoreData

class CreatorForm_TableViewController: UITableViewController {
    
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
    var arrayCell: [Int : PrototypeTableViewCell] = [:]
    var oklogin : Bool = false {
        didSet {
            loginAction?.isEnabled = oklogin
        }
    }
    
    var loginAction: UIAlertAction?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayCell.count
    }

    
    @IBAction func insertItem(_ sender: AnyObject) {
        tableView.beginUpdates()
        arrayCell[arrayCell.count+1] = PrototypeTableViewCell();
        tableView.insertRows(at: [IndexPath(row: arrayCell.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath) as! PrototypeTableViewCell
        arrayCell[arrayCell.count] = cell;
        
        return cell
    }
    
    @IBAction func Savethisform(_ sender: AnyObject) {
        

        let alertController = UIAlertController(title: "Message", message: "Enter a name for your form", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            _ in print("exit pop up")
        }
        let context = appDel.persistentContainer.viewContext
        
        loginAction = UIAlertAction(title: "Save", style: .default) { [weak alertController] _ in
             if let alertController = alertController {
                let loginTextField = alertController.textFields![0] as UITextField
                
                print(loginTextField.text)
                
                let form = Form(context: context)
                form.nom = loginTextField.text
                for (cellkey ,cellvalu) in self.arrayCell {
                    
                    let champ = Champ(context: context)
                    print(" \(cellkey) : \(cellvalu.fieldText.text)")
                    let type = Type(context: context)
                    print(cellvalu.selectedValue)
                    type.label = cellvalu.selectedValue
                    champ.label = cellvalu.fieldText.text
                    champ.typeC = type
                    champ.formC = form
                    champ.value = ""
                }
                try? context.save()
                // rendre tableView vide
                self.arrayCell.removeAll()
                self.tableView.reloadData()
                
            }
            
        }
        
        loginAction?.isEnabled = false
        
        alertController.addTextField { (setNametextField) in
            print("coucou")
            setNametextField.placeholder = "mini 4 characters"
            setNametextField.addTarget(self, action: #selector(self.tfDidChange), for: .editingChanged)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(loginAction!)
        present(alertController, animated: true, completion: nil)
    }
    
    func tfDidChange(_ sender: UITextField) {
        if (sender.text!.characters.count >= 4) {
            print(sender.text!.characters.count)
            oklogin = true
        }
        else{
            oklogin = false
        }
        
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
