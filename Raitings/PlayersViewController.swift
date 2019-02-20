//
//  PlayersViewController.swift
//  Raitings
//
//  Created by DmytroKohut on 1/24/19.
//  Copyright © 2019 DmytroKohut. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        print("viewWillAppear")
    }
    // MARK: - Properties
    var players = SampleData.generatePlayersData()
}

extension PlayersViewController {
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        
        guard let playerDetailsViewController = segue.source as? PlayerDetailsViewController,
            let player = playerDetailsViewController.player else {
                return
        }
        
        // add the new player to the players array
        players.append(player)
        
        // update the tableView
        let indexPath = IndexPath(row: players.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - UITableViewDataSource
extension PlayersViewController {
    
    override func viewDidLoad() {
        print("viewDidLoad", self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        print(animated)
        super.viewDidAppear(true)
//        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        print(animated)
//        print("viewWillDisappear")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return players.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        
//        print(tableView.contentOffset);
        let player = players[indexPath.row]
        cell.player = player
//        cell.textLabel?.text = player.name
//        cell.detailTextLabel?.text = player.game
//        cell.description?.text = "desciption"
        return cell
    }
}
