//
//  SampleData.swift
//  Raitings
//
//  Created by DmytroKohut on 1/24/19.
//  Copyright © 2019 DmytroKohut. All rights reserved.
//

import Foundation

final class SampleData {
    
    static func generatePlayersData() -> [Player] {
        
        return [
            Player(name: "Tony Start", game: "Tic-Tac-Toe", rating: 4),
            Player(name: "Oscar Peterson", game: "Spin the Bottle", rating: 5),
            Player(name: "Dave Brubeck", game: "Texas Hold 'em Poker", rating: 2)
        ]
    }
}
