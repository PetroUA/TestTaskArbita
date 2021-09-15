//
//  TilesViewController.swift
//  TestTaskArbita
//
//  Created by Petro on 14.09.2021.
//

import Foundation
import UIKit

struct LevelConfiguration {
    let numberOfColumns: Int
    let numberOfRows: Int
    let isLastLevel: Bool
}


class TilesViewController: UIViewController {
    
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    static func inistantiateViewController(levelConfiguration: LevelConfiguration) -> TilesViewController {
        let storyboard = UIStoryboard(name: "TilesStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "tilesStoryboard") as! TilesViewController
        viewController.levelConfiguration = levelConfiguration
        
        return viewController
    }
    
    private var levelConfiguration: LevelConfiguration!
    
    @objc func buttonAction(sender: UIButton!) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("have not that card")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0 ..< levelConfiguration.numberOfRows {
            var rowButtons: [UIButton] = []
            
            for _ in 0 ..< levelConfiguration.numberOfColumns {
                let button = UIButton()
                button.backgroundColor = .orange
                button.setTitle("", for: .normal)
                button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                rowButtons.append(button)
                view.addSubview(button)
                cardButtons.append(button)
            }
            
            let rowStackView = UIStackView(arrangedSubviews: rowButtons)
            rowStackView.axis = .horizontal
            rowStackView.alignment = .fill
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 16
            buttonsStackView.addArrangedSubview(rowStackView)
        }
        
    }
    
    lazy var  game = Game(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    var emojiChoices = ["🕷", "🎃", "👻", "💀", "👽", "🐍", "🦅", "🦉", "🦇", "🐗", "🐺", "🐴", "🐝", "🦋", "🐞", "🐜", "🦈", "🐳", "🦎", "🦖", "🦒", "🐅", "🦑"]
    
    var cardButtons: [UIButton] = []
    
    func updateViewFromModel() {
        var gameEnd = true
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.tiles[index]
            //print("\(index)-\(card)")
            if !card.isMatched {
                gameEnd = false
            }
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            if levelConfiguration.isLastLevel {
                if card.isTapedSecondTime {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        if gameEnd {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    var emoji = [Int : String]()
    
    func emoji(for card: Tile) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
        
    }
}
