//
//  LevelsViewController.swift
//  TestTaskArbita
//
//  Created by Petro on 09.09.2021.
//

import Foundation
import UIKit
import GoogleMobileAds

class LevelsViewController: UIViewController {
    @IBOutlet weak var levelStackView: UIStackView!
    
    var levelNumberController = LevelNumberController(numberOfLevels: 6)
    var bannerView: GADBannerView!
    
    static func inistantiateViewController(levelConfiguration: LevelConfiguration) -> LevelsViewController {
        let storyboard = UIStoryboard(name: "ChoseLevelStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "choseLevelStoryboard")
        return viewController as! LevelsViewController
    }
    
    @objc func buttonAction(sender: UIButton!) {
        if let text = sender.titleLabel?.text, let number = Int(text) {
            let tilesStoryboard = TilesViewController.inistantiateViewController(levelConfiguration: levelNumberController.getLevel(numberOfLevel: number))
            self.present(tilesStoryboard, animated: true, completion: nil)
        } else {
            print("No such level")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var levelNumber = 0
        let numberOfRows = levelNumberController.getNumberOfLevels() / 3
        let numberOfColumns = 3
        for _ in 0 ..< numberOfRows {
            var rowButtons: [UIButton] = []
            
            for _ in 0 ..< numberOfColumns {
                let button = UIButton()
                button.backgroundColor = .orange
                levelNumber += 1
                button.setTitle("\(levelNumber)", for: .normal)
                button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                rowButtons.append(button)
                view.addSubview(button)
            }
            
            let rowStackView = UIStackView(arrangedSubviews: rowButtons)
            rowStackView.axis = .horizontal
            rowStackView.alignment = .fill
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 16
            levelStackView.addArrangedSubview(rowStackView)
        }
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"//"ca-app-pub-4930380402446640/7821365952"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        levelStackView.addArrangedSubview(bannerView)

    }
}
