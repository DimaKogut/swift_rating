//
//  GamePickerViewController.swift
//  Raitings
//
//  Created by DmytroKohut on 2/19/19.
//  Copyright © 2019 DmytroKohut. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Did Load")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    // MARK: - Properties
    var games = [
        "Angry Birds",
        "Chess",
        "Russian Roulette",
        "Spin the Bottle",
        "Texas Hold'em Poker",
        "Tic-Tac-Toe"
    ]
    
    var selectedGame: String? {
        didSet {
            if let selectedGame = selectedGame,
                let index = games.index(of: selectedGame) {
                selectedGameIndex = index
            }
        }
    }
    
    var selectedGameIndex: Int?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "SaveSelectedGame",
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) else {
                return
        }
        
        let index = indexPath.row
        selectedGame = games[index]
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDataSource

extension GamePickerViewController {
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        return games.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        cell.textLabel?.text = games[indexPath.row]
        
        if indexPath.row == selectedGameIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
}

// MARK: - UITableVIewDelegate
extension GamePickerViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Other row is selected - need to deselect it
        if let index = selectedGameIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        selectedGame = games[indexPath.row]
        
        // update the checkmark for the current row
        let cell = tableView.cellForRow(at: (indexPath))
        cell?.accessoryType = .checkmark
    }
    
}
