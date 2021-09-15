//
//  zzz.swift
//  TestTaskArbita
//
//  Created by Petro on 14.09.2021.
//
/*
import UIKit

struct LevelConfiguration {
    let numberOfColumns: Int
    let numberOfRows: Int
}

class Zzz: UIViewController {
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    static func inistantiateViewController(levelConfiguration: LevelConfiguration) -> Zzz {
        let storyboard = UIStoryboard(name: "zzz", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "Zzz") as! Zzz
        viewController.levelConfiguration = levelConfiguration
        
        return viewController
    }
    
    private var levelConfiguration: LevelConfiguration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for row in 0 ..< levelConfiguration.numberOfRows {
            var rowButtons: [UIButton] = []
            
            for column in 0 ..< levelConfiguration.numberOfColumns {
                let button = UIButton()
                
//                button.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
                
                rowButtons.append(button)
            }
            
            let rowStackView = UIStackView(arrangedSubviews: rowButtons)
            rowStackView.axis = .horizontal
            rowStackView.alignment = .fill
            rowStackView.distribution = .fill
            rowStackView.spacing = 32
            
            buttonsStackView.addArrangedSubview(rowStackView)
        }
        
        
//        if !userHasNoAdsPurchase {
//            let adsView = UIView()
//            buttonsStackView.addArrangedSubview(adsView)
//        }
        
    }
}
*/
