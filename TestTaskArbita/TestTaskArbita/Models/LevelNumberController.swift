//
//  LevelNumberController.swift
//  TestTaskArbita
//
//  Created by Petro on 14.09.2021.
//

import Foundation
import UIKit

class LevelNumberController {
    let numberOfLevels: Int
    
    init(numberOfLevels: Int) {
        self.numberOfLevels = numberOfLevels
    }
    
    func getNumberOfLevels() -> Int {
        return numberOfLevels
    }
    
    func getLevel(numberOfLevel: Int) ->  LevelConfiguration {
        
        var levelConfiguration: LevelConfiguration
        var isLastLevel = false
        
        if numberOfLevels == numberOfLevel {
            isLastLevel = true
        }
        
        if (numberOfLevel + 1) * (numberOfLevel + 1) % 2 == 0 {
            
            levelConfiguration = LevelConfiguration(levelNumber: numberOfLevel, numberOfColumns: numberOfLevel + 1, numberOfRows: numberOfLevel + 1, isLastLevel: isLastLevel)
        } else {
            
            levelConfiguration = LevelConfiguration(levelNumber: numberOfLevel, numberOfColumns: numberOfLevel, numberOfRows: numberOfLevel + 1, isLastLevel: isLastLevel)
        }
        return levelConfiguration
    }
}
