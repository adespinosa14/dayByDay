//
//  settingsViewController.swift
//  Day by Day
//
//  Created by Andrew Espinosa on 8/15/22.
//

import UIKit

class settingsViewController: UIViewController {

    @IBOutlet weak var mainBackground: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buttonStyle: UIButton!
    @IBOutlet weak var changeNameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = String("Name: \(newName.sharedInstance.name)")
        
        switch subscriptionType.sharedInstance.subType{
        case true:
                switch themeSelection.sharedInstance.selectedTheme{
                case 0:
                    //DEFAULT
                    nameLabel.textColor = UIColor(named: "defaultPop")
                    changeNameButton.tintColor = UIColor(named: "defaultPop")
                    buttonStyle.backgroundColor = UIColor(named: "defaultPop")
                    mainBackground.image = UIImage(named: "defaultBackground")
                    break
                    
                case 1:
                    //SUNSET
                    nameLabel.textColor = UIColor(named: "sunsetPop")
                    changeNameButton.tintColor = UIColor(named: "sunsetPop")
                    buttonStyle.backgroundColor = UIColor(named: "sunsetPop")
                    mainBackground.image = UIImage(named: "sunsetBackground")
                    break
                    
                case 2:
                    //DUSK
                    nameLabel.textColor = UIColor(named: "duskPop")
                    changeNameButton.tintColor = UIColor(named: "duskPop")
                    buttonStyle.backgroundColor = UIColor(named: "duskPop")
                    mainBackground.image = UIImage(named: "duskBackground")
                    break
                case 3:
                    //RAINFOREST
                    nameLabel.textColor = UIColor(named: "rainforestPop")
                    changeNameButton.tintColor = UIColor(named: "rainforestPop")
                    buttonStyle.backgroundColor = UIColor(named: "rainforestPop")
                    mainBackground.image = UIImage(named: "rainforestBackground")
                    break
                case 4:
                    //UNDETERMINED ONE
                    nameLabel.textColor = UIColor(named: "undeterminedPop")
                    changeNameButton.tintColor = UIColor(named: "undeterminedPop")
                    buttonStyle.backgroundColor = UIColor(named: "undeterminedPop")
                    mainBackground.image = UIImage(named: "undeterminedBackground")
                    break
                    
                case 5:
                    //UNDETERMINED TWO
                    nameLabel.textColor = UIColor(named: "undeterminedTwoPop")
                    changeNameButton.tintColor = UIColor(named: "undeterminedTwoPop")
                    buttonStyle.backgroundColor = UIColor(named: "undeterminedTwoPop")
                    mainBackground.image = UIImage(named: "undeterminedTwoBackground")
                    
                default:
                    print("This Code Should Not Run")
                }
            
            break
        default:
            nameLabel.textColor = UIColor(named: "defaultPop")
            changeNameButton.tintColor = UIColor(named: "defaultPop")
            buttonStyle.backgroundColor = UIColor(named: "defaultPop")
            mainBackground.image = UIImage(named: "defaultBackground")
            
        }
        
    }
    
    @IBAction func changeNamePressed(_ sender: Any) {
        performSegue(withIdentifier: "changeName", sender: nil)
    }
    
    
}
