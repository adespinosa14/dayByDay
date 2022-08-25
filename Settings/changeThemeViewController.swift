//
//  changeThemeViewController.swift
//  Day by Day
//
//  Created by Andrew Espinosa on 8/15/22.
//

import UIKit

class changeThemeViewController: UIViewController {

    @IBOutlet weak var defaultButton: UIButton!
    @IBOutlet weak var sunsetButton: UIButton!
    @IBOutlet weak var duskButton: UIButton!
    @IBOutlet weak var rainforestButton: UIButton!
    @IBOutlet weak var undeterminedButton: UIButton!
    @IBOutlet weak var undeterminedTwoButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch subscriptionType.sharedInstance.subType{
        case true:
            
                switch themeSelection.sharedInstance.selectedTheme{
                case 0:
                    //DEFAULT
                    defaultButton.backgroundColor = UIColor(named: "defaultText")
                    sunsetButton.backgroundColor = UIColor(named: "defaultPop")
                    duskButton.backgroundColor = UIColor(named: "defaultPop")
                    rainforestButton.backgroundColor = UIColor(named: "defaultPop")
                    undeterminedButton.backgroundColor = UIColor(named: "defaultPop")
                    undeterminedTwoButton.backgroundColor = UIColor(named: "defaultPop")
                    self.view.backgroundColor = UIColor(named: "defaultBackground")
                    progressBar.trackTintColor = UIColor(named: "defaultPop")
                    progressBar.progressTintColor = UIColor(named: "defaultPop")
                    break
                    
                case 1:
                    //SUNSET
                    defaultButton.backgroundColor = UIColor(named: "sunsetPop")
                    sunsetButton.backgroundColor = UIColor(named: "sunsetText")
                    duskButton.backgroundColor = UIColor(named: "sunsetPop")
                    rainforestButton.backgroundColor = UIColor(named: "sunsetPop")
                    undeterminedButton.backgroundColor = UIColor(named: "sunsetPop")
                    undeterminedTwoButton.backgroundColor = UIColor(named: "sunsetPop")
                    self.view.backgroundColor = UIColor(named: "sunsetBackground")
                    progressBar.trackTintColor = UIColor(named: "sunsetPop")
                    progressBar.progressTintColor = UIColor(named: "sunsetPop")
                    break
                    
                case 2:
                    //DUSK
                    defaultButton.backgroundColor = UIColor(named: "duskPop")
                    sunsetButton.backgroundColor = UIColor(named: "duskPop")
                    duskButton.backgroundColor = UIColor(named: "duskText")
                    rainforestButton.backgroundColor = UIColor(named: "duskPop")
                    undeterminedButton.backgroundColor = UIColor(named: "duskPop")
                    undeterminedTwoButton.backgroundColor = UIColor(named: "duskPop")
                    self.view.backgroundColor = UIColor(named: "duskBackground")
                    progressBar.trackTintColor = UIColor(named: "duskPop")
                    progressBar.progressTintColor = UIColor(named: "duskPop")
                    break
                case 3:
                    //RAINFOREST
                    defaultButton.backgroundColor = UIColor(named: "rainforestPop")
                    sunsetButton.backgroundColor = UIColor(named: "rainforestPop")
                    duskButton.backgroundColor = UIColor(named: "rainforestPop")
                    rainforestButton.backgroundColor = UIColor(named: "rainforestText")
                    undeterminedButton.backgroundColor = UIColor(named: "rainforestPop")
                    undeterminedTwoButton.backgroundColor = UIColor(named: "rainforestPop")
                    self.view.backgroundColor = UIColor(named: "rainforestBackground")
                    progressBar.trackTintColor = UIColor(named: "rainforestPop")
                    progressBar.progressTintColor = UIColor(named: "rainforestPop")
                    break
                case 4:
                    //UNDETERMINED ONE
                    defaultButton.backgroundColor = UIColor(named: "undeterminedPop")
                    sunsetButton.backgroundColor = UIColor(named: "undeterminedPop")
                    duskButton.backgroundColor = UIColor(named: "undeterminedPop")
                    rainforestButton.backgroundColor = UIColor(named: "undeterminedPop")
                    undeterminedButton.backgroundColor = UIColor(named: "undeterminedText")
                    undeterminedTwoButton.backgroundColor = UIColor(named: "undeterminedPop")
                    progressBar.trackTintColor = UIColor(named: "undeterminedPop")
                    progressBar.progressTintColor = UIColor(named: "undeterminedPop")
                    break
                    
                case 5:
                    //UNDETERMINED TWO
                    defaultButton.backgroundColor = UIColor(named: "undeterminedTwoPop")
                    sunsetButton.backgroundColor = UIColor(named: "undeterminedTwoPop")
                    duskButton.backgroundColor = UIColor(named: "undeterminedTwoPop")
                    rainforestButton.backgroundColor = UIColor(named: "undeterminedTwoPop")
                    undeterminedButton.backgroundColor = UIColor(named: "undeterminedTwoPop")
                    undeterminedTwoButton.backgroundColor = UIColor(named: "undeterminedTwoText")
                    progressBar.trackTintColor = UIColor(named: "undeterminedTwoPop")
                    progressBar.progressTintColor = UIColor(named: "undeterminedTwoPop")
                    
                default:
                    print("This Code Should Not Run")
                }
            
            break
        default:
            
            defaultButton.backgroundColor = UIColor(named: "defaultText")
            sunsetButton.backgroundColor = UIColor(named: "defaultPop")
            duskButton.backgroundColor = UIColor(named: "defaultPop")
            rainforestButton.backgroundColor = UIColor(named: "defaultPop")
            undeterminedButton.backgroundColor = UIColor(named: "defaultPop")
            undeterminedTwoButton.backgroundColor = UIColor(named: "defaultPop")
            self.view.backgroundColor = UIColor(named: "defaultBackground")
            progressBar.trackTintColor = UIColor(named: "defaultPop")
            progressBar.progressTintColor = UIColor(named: "defaultPop")
            
        }
        
    }
    
    //MARK: Default Pressed

    @IBAction func defaultPressed(_ sender: Any) {
        themeSelection.sharedInstance.selectedTheme = 0
        UserDefaults.standard.set(themeSelection.sharedInstance.selectedTheme, forKey: "selectedThemeSave")
        
//        subscriptionType.sharedInstance.subType = true
//        UserDefaults.standard.set(subscriptionType.sharedInstance.subType, forKey: "subTypeSave")
        
        let alert = UIAlertController(title: "Change Successful", message: "Restart the app the see the changes", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay!", style: .default)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Sunset Pressed
    
    @IBAction func sunsetPressed(_ sender: Any) {
        
        switch subscriptionType.sharedInstance.subType{
        case true:
            
            themeSelection.sharedInstance.selectedTheme = 1
            UserDefaults.standard.set(themeSelection.sharedInstance.selectedTheme, forKey: "selectedThemeSave")
            
            subscriptionType.sharedInstance.subType = true
            UserDefaults.standard.set(subscriptionType.sharedInstance.subType, forKey: "subTypeSave")
            
            let alert = UIAlertController(title: "Change Successful", message: "Restart the app the see the changes", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay!", style: .default)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
            break;
        default:
            
                performSegue(withIdentifier: "iapRequestPage", sender: nil)
            
        }
        
    }
    
    //MARK: Dusk Pressed
    
    @IBAction func duskPressed(_ sender: Any) {
        
        switch subscriptionType.sharedInstance.subType{
        case true:
            
            themeSelection.sharedInstance.selectedTheme = 2
            UserDefaults.standard.set(themeSelection.sharedInstance.selectedTheme, forKey: "selectedThemeSave")
            
            subscriptionType.sharedInstance.subType = true
            UserDefaults.standard.set(subscriptionType.sharedInstance.subType, forKey: "subTypeSave")
            
            let alert = UIAlertController(title: "Change Successful", message: "Restart the app the see the changes", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay!", style: .default)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
            break;
            
        default:
            performSegue(withIdentifier: "iapRequestPage", sender: nil)
        }

    }
    
    //MARK: Rainforest Pressed
    
    @IBAction func rainforestPressed(_ sender: Any) {
        
        switch subscriptionType.sharedInstance.subType{
        case true:
            
            themeSelection.sharedInstance.selectedTheme = 3
            UserDefaults.standard.set(themeSelection.sharedInstance.selectedTheme, forKey: "selectedThemeSave")
            
            subscriptionType.sharedInstance.subType = true
            UserDefaults.standard.set(subscriptionType.sharedInstance.subType, forKey: "subTypeSave")
            
            let alert = UIAlertController(title: "Change Successful", message: "Restart the app the see the changes", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay!", style: .default)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
            
            break;
        default:
            performSegue(withIdentifier: "iapRequestPage", sender: nil)
        }
        
    }
    
    //MARK: Undetermined Pressed
    
    @IBAction func undetermiendPressed(_ sender: Any) {
        
        switch subscriptionType.sharedInstance.subType{
        case true:
            themeSelection.sharedInstance.selectedTheme = 4
            UserDefaults.standard.set(themeSelection.sharedInstance.selectedTheme, forKey: "selectedThemeSave")
            
            subscriptionType.sharedInstance.subType = true
            UserDefaults.standard.set(subscriptionType.sharedInstance.subType, forKey: "subTypeSave")
            
            let alert = UIAlertController(title: "Change Successful", message: "Restart the app the see the changes", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay!", style: .default)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
            break;
        default:
            performSegue(withIdentifier: "iapRequestPage", sender: nil)
        }
        
    }
    
    //MARK: Undetermined Two Pressed
    
    @IBAction func undeterminedTwoPressed(_ sender: Any) {
        
        switch subscriptionType.sharedInstance.subType{
        case true:
            themeSelection.sharedInstance.selectedTheme = 5
            UserDefaults.standard.set(themeSelection.sharedInstance.selectedTheme, forKey: "selectedThemeSave")
            
            subscriptionType.sharedInstance.subType = true
            UserDefaults.standard.set(subscriptionType.sharedInstance.subType, forKey: "subTypeSave")
            
            let alert = UIAlertController(title: "Change Successful", message: "Restart the app the see the changes", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay!", style: .default)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
            break;
        default:
            performSegue(withIdentifier: "iapRequestPage", sender: nil)
        }
        
    }
    
    
}
