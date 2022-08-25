//
//  settingsNavigationViewController.swift
//  Pods
//
//  Created by Andrew Espinosa on 8/15/22.
//

import UIKit

class settingsNavigationViewController: UINavigationController {

    var navigationBarAppearace = UINavigationBar.appearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch subscriptionType.sharedInstance.subType{
        case true:
                switch themeSelection.sharedInstance.selectedTheme{
                case 0:
                    //DEFAULT
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "defaultPop")!]
                    self.navigationBar.tintColor = UIColor(named: "defaultText")
                    break
                    
                case 1:
                    //SUNSET
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "sunsetPop")!]
                    self.navigationBar.tintColor = UIColor(named: "sunsetText")
                    break
                    
                case 2:
                    //DUSK
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "duskPop")!]
                    self.navigationBar.tintColor = UIColor(named: "duskText")
                    break
                case 3:
                    //RAINFOREST
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "rainforestPop")!]
                    self.navigationBar.tintColor = UIColor(named: "rainforestText")
                    break
                case 4:
                    //UNDETERMINED ONE
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "undeterminedPop")!]
                    self.navigationBar.tintColor = UIColor(named: "undeterminedText")
                    break
                    
                case 5:
                    //UNDETERMINED TWO
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "undeterminedTwoPop")!]
                    self.navigationBar.tintColor = UIColor(named: "undeterminedTwoText")
                    
                default:
                    print("This Code Should Not Run")
                }
            
            break
        default:
            navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "defaultPop")!]
            self.navigationBar.tintColor = UIColor(named: "defaultText")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        switch subscriptionType.sharedInstance.subType{
        case true:
                switch themeSelection.sharedInstance.selectedTheme{
                case 0:
                    //DEFAULT
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "defaultPop")!]
                    self.navigationBar.tintColor = UIColor(named: "defaultText")
                    break
                    
                case 1:
                    //SUNSET
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "sunsetPop")!]
                    self.navigationBar.tintColor = UIColor(named: "sunsetText")
                    break
                    
                case 2:
                    //DUSK
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "duskPop")!]
                    self.navigationBar.tintColor = UIColor(named: "duskText")
                    break
                case 3:
                    //RAINFOREST
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "rainforestPop")!]
                    self.navigationBar.tintColor = UIColor(named: "rainforestText")
                    break
                case 4:
                    //UNDETERMINED ONE
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "undeterminedPop")!]
                    self.navigationBar.tintColor = UIColor(named: "undeterminedText")
                    break
                    
                case 5:
                    //UNDETERMINED TWO
                    navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "undeterminedTwoPop")!]
                    self.navigationBar.tintColor = UIColor(named: "undeterminedTwoText")
                    
                default:
                    print("This Code Should Not Run")
                }
            
            break
        default:
            navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "defaultPop")!]
            self.navigationBar.tintColor = UIColor(named: "defaultText")
        }
    }

}
