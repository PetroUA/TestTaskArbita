//
//  Game.swift
//  TestTaskArbita
//
//  Created by Petro on 12.09.2021.
//

import Foundation
import UIKit

class Game {
    var tiles = [Tile]()
    
    var indexOfOneAndOnlyFaceUp: Int?
    
    func chooseCard(at index: Int){
        if let matchIndex = indexOfOneAndOnlyFaceUp, matchIndex != index {
            if tiles[matchIndex].identifier == tiles[index].identifier  {
                tiles[matchIndex].isMatched = true
                tiles[index].isMatched = true
            }
            if tiles[index].isTapedFirstTime {
                tiles[index].isTapedSecondTime = true
            }
            tiles[index].isTapedFirstTime = true
            tiles[index].isFaceUp = true
            indexOfOneAndOnlyFaceUp = nil
        } else {
            for flipDownIndex in tiles.indices {
                tiles[flipDownIndex].isFaceUp = false
            }
            tiles[index].isFaceUp = true
            indexOfOneAndOnlyFaceUp = index
            
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0 ..< numberOfPairsOfCards {
            let tile = Tile()
            tiles += [tile, tile]
            tiles = tiles.shuffled()
        }
    }
}
