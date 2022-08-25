//
//  TabBarViewController.swift
//  
//
//  Created by Andrew Espinosa on 8/15/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch subscriptionType.sharedInstance.subType{
        case true:
                switch themeSelection.sharedInstance.selectedTheme{
                case 0:
                    //DEFAULT
                    UITabBar.appearance().tintColor = UIColor(named: "defaultText")
                    break
                    
                case 1:
                    //SUNSET
                    UITabBar.appearance().tintColor = UIColor(named: "sunsetText")
                    break
                    
                case 2:
                    //DUSK
                    UITabBar.appearance().tintColor = UIColor(named: "duskText")
                    break
                case 3:
                    //RAINFOREST
                    UITabBar.appearance().tintColor = UIColor(named: "rainforestText")
                    break
                case 4:
                    //UNDETERMINED ONE
                    UITabBar.appearance().tintColor = UIColor(named: "undeterminedText")
                    break
                    
                case 5:
                    //UNDETERMINED TWO
                    UITabBar.appearance().tintColor = UIColor(named: "undeterminedTwoText")
                    
                default:
                    print("This Code Should Not Run")
                }
            
            break
        default:
            UITabBar.appearance().tintColor = UIColor(named: "defaultText")
        }
        
    }

}
