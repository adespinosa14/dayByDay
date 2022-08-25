//
//  ViewController.swift
//  Day by Day
//
//  Created by Andrew Espinosa on 7/13/22.
//

import UIKit
import Purchases
class ViewController: UIViewController {
    @IBOutlet weak var secondViewContraintTop: NSLayoutConstraint!
    @IBOutlet var screenSwipe: UISwipeGestureRecognizer!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var checkInButton: UIButton!
    @IBOutlet weak var secondMainImage: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
   
// HOME Variables
    @IBOutlet weak var barTimer: UISlider!
    @IBOutlet weak var barTimerRight: NSLayoutConstraint!
    @IBOutlet weak var barTimerTop: NSLayoutConstraint!
    @IBOutlet weak var nameGreeting: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var todayUserInput: UITextField!
    @IBOutlet weak var underlineProgressView: UIProgressView!
    @IBOutlet weak var quoteLabel: UILabel!
    var thumbColor = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Selected Theme: \(themeSelection.sharedInstance.selectedTheme)")
        print("Subscription Type: \(subscriptionType.sharedInstance.subType)")
        
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.layer.shadowOpacity = 0.3
        secondView.layer.shadowOffset = .zero
        secondView.layer.shadowRadius = 20
        secondViewContraintTop.constant = 0
            
        print(userInformationSavedData.sharedInstance.userInfo)
        print(userInformationSavedData.sharedInstance.images)
        print(userInformationSavedData.sharedInstance.dates)
        
        if(newName.sharedInstance.newUser == 0){
            performSegue(withIdentifier: "changeName", sender: nil)
            nameGreeting.text = "Welcome Back!"
        }else{
            nameGreeting.text = "Welcome Back, \(newName.sharedInstance.name)"
        }
        
//MARK: Theme Selection
        
        switch subscriptionType.sharedInstance.subType{
        case true:
            
            switch themeSelection.sharedInstance.selectedTheme{
            case 0:
                //DEFAULT
                checkInButton.backgroundColor = UIColor(named: "defaultPop")
                adviceLabel.textColor = UIColor(named: "defaultText")
                secondMainImage.image = UIImage(named: "defaultBackground")
                progressView.trackTintColor = UIColor(named: "defaultPop")
                progressView.progressTintColor = UIColor(named: "defaultPop")
                
                mainImage.image = UIImage(named: "mainDefaultBackground")
                barTimer.minimumTrackTintColor = UIColor(named: "defaultText")
                barTimer.maximumTrackTintColor = UIColor(named: "defaultText")
                nameGreeting.textColor = UIColor(named: "defaultPop")
                todayLabel.textColor = UIColor(named: "defaultText")
                underlineProgressView.progressTintColor = UIColor(named: "defaultPop")
                underlineProgressView.trackTintColor = UIColor(named: "defaultPop")
                quoteLabel.textColor = UIColor(named: "defaultPop")
                todayUserInput.textColor = UIColor(named: "defaultPop")
                thumbColor = "default"
                break
                
            case 1:
                //SUNSET
                checkInButton.backgroundColor = UIColor(named: "sunsetPop")
                adviceLabel.textColor = UIColor(named: "sunsetText")
                secondMainImage.image = UIImage(named: "sunsetBackground")
                mainImage.image = UIImage(named: "sunsetBackground")
                progressView.trackTintColor = UIColor(named: "sunsetPop")
                progressView.progressTintColor = UIColor(named: "sunsetPop")
                
                mainImage.image = UIImage(named: "mainSunsetBackground")
                barTimer.minimumTrackTintColor = UIColor(named: "sunsetText")
                barTimer.maximumTrackTintColor = UIColor(named: "sunsetText")
                nameGreeting.textColor = UIColor(named: "sunsetPop")
                todayLabel.textColor = UIColor(named: "sunsetText")
                underlineProgressView.progressTintColor = UIColor(named: "sunsetPop")
                underlineProgressView.trackTintColor = UIColor(named: "sunsetPop")
                quoteLabel.textColor = UIColor(named: "sunsetPop")
                todayUserInput.textColor = UIColor(named: "sunsetPop")
                thumbColor = "sunset"
                
                break
                
            case 2:
                //DUSK
                checkInButton.backgroundColor = UIColor(named: "duskPop")
                adviceLabel.textColor = UIColor(named: "duskText")
                secondMainImage.image = UIImage(named: "duskBackground")
                mainImage.image = UIImage(named: "duskBackground")
                progressView.trackTintColor = UIColor(named: "duskPop")
                progressView.progressTintColor = UIColor(named: "duskPop")
                
                mainImage.image = UIImage(named: "mainDuskBackground")
                barTimer.minimumTrackTintColor = UIColor(named: "duskText")
                barTimer.maximumTrackTintColor = UIColor(named: "duskText")
                nameGreeting.textColor = UIColor(named: "duskPop")
                todayLabel.textColor = UIColor(named: "duskText")
                underlineProgressView.progressTintColor = UIColor(named: "duskPop")
                underlineProgressView.trackTintColor = UIColor(named: "duskPop")
                quoteLabel.textColor = UIColor(named: "duskPop")
                todayUserInput.textColor = UIColor(named: "duskPop")
                thumbColor = "dusk"
                
                break
            case 3:
                //RAINFOREST
                checkInButton.backgroundColor = UIColor(named: "rainforestPop")
                adviceLabel.textColor = UIColor(named: "rainforestText")
                secondMainImage.image = UIImage(named: "rainforestBackground")
                mainImage.image = UIImage(named: "rainforestBackground")
                progressView.trackTintColor = UIColor(named: "rainforestPop")
                progressView.progressTintColor = UIColor(named: "rainforestPop")
                
                mainImage.image = UIImage(named: "mainRainforestBackground")
                barTimer.minimumTrackTintColor = UIColor(named: "rainforestText")
                barTimer.maximumTrackTintColor = UIColor(named: "rainforestText")
                nameGreeting.textColor = UIColor(named: "rainforestPop")
                todayLabel.textColor = UIColor(named: "rainforestText")
                underlineProgressView.progressTintColor = UIColor(named: "rainforestPop")
                underlineProgressView.trackTintColor = UIColor(named: "rainforestPop")
                quoteLabel.textColor = UIColor(named: "rainforestPop")
                todayUserInput.textColor = UIColor(named: "rainforestPop")
                thumbColor = "rainforest"
                
                break
            case 4:
                //UNDETERMINED ONE
                checkInButton.backgroundColor = UIColor(named: "undeterminedPop")
                adviceLabel.textColor = UIColor(named: "undeterminedText")
                secondMainImage.image = UIImage(named: "undeterminedBackground")
                mainImage.image = UIImage(named: "undeterminedBackground")
                progressView.trackTintColor = UIColor(named: "undeterminedPop")
                progressView.progressTintColor = UIColor(named: "undeterminedPop")
                
                mainImage.image = UIImage(named: "mainUndeterminedBackground")
                barTimer.minimumTrackTintColor = UIColor(named: "undeterminedText")
                barTimer.maximumTrackTintColor = UIColor(named: "undeterminedText")
                nameGreeting.textColor = UIColor(named: "undeterminedPop")
                todayLabel.textColor = UIColor(named: "undeterminedText")
                underlineProgressView.progressTintColor = UIColor(named: "undeterminedPop")
                underlineProgressView.trackTintColor = UIColor(named: "undeterminedPop")
                quoteLabel.textColor = UIColor(named: "undeterminedPop")
                todayUserInput.textColor = UIColor(named: "undeterminedPop")
                thumbColor = "undetermined"
                
                break
                
            case 5:
                //UNDETERMINED TWO
                checkInButton.backgroundColor = UIColor(named: "undeterminedTwoPop")
                adviceLabel.textColor = UIColor(named: "undeterminedTwoText")
                secondMainImage.image = UIImage(named: "undeterminedTwoBackground")
                mainImage.image = UIImage(named: "undeterminedTwoBackground")
                progressView.trackTintColor = UIColor(named: "undeterminedTwoPop")
                progressView.progressTintColor = UIColor(named: "undeterminedTwoPop")
                
                mainImage.image = UIImage(named: "mainUndeterminedTwoBackground")
                barTimer.minimumTrackTintColor = UIColor(named: "undeterminedTwoText")
                barTimer.maximumTrackTintColor = UIColor(named: "undeterminedTwoText")
                nameGreeting.textColor = UIColor(named: "undeterminedTwoPop")
                todayLabel.textColor = UIColor(named: "undeterminedTwoText")
                underlineProgressView.progressTintColor = UIColor(named: "undeterminedTwoPop")
                underlineProgressView.trackTintColor = UIColor(named: "undeterminedTwoPop")
                quoteLabel.textColor = UIColor(named: "undeterminedTwoPop")
                todayUserInput.textColor = UIColor(named: "undeterminedTwoPop")
                thumbColor = "undeterminedTwo"
                
            default:
                print("This Code Should Not Run")
            }
            
        default:
            checkInButton.backgroundColor = UIColor(named: "defaultPop")
            adviceLabel.textColor = UIColor(named: "defaultText")
            secondMainImage.image = UIImage(named: "defaultBackground")
            mainImage.image = UIImage(named: "mainDefaultBackground")
            navigationController?.navigationBar.barTintColor = UIColor.black
            progressView.trackTintColor = UIColor(named: "defaultPop")
            progressView.progressTintColor = UIColor(named: "defaultPop")
            
            mainImage.image = UIImage(named: "mainDefaultBackground")
            barTimer.minimumTrackTintColor = UIColor(named: "defaultText")
            barTimer.maximumTrackTintColor = UIColor(named: "defaultText")
            nameGreeting.textColor = UIColor(named: "defaultPop")
            todayLabel.textColor = UIColor(named: "defaultText")
            underlineProgressView.progressTintColor = UIColor(named: "defaultPop")
            underlineProgressView.trackTintColor = UIColor(named: "defaultPop")
            quoteLabel.textColor = UIColor(named: "defaultPop")
            thumbColor = "default"
        }
//END COLORS
            
        let textData = UserDefaults.standard.object(forKey: "todaySaved")
        todayUserInput.text = textData as? String
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let string = formatter.string(from: date)
        print(string)
        barTimer.value = Float(Int(string)!)
        
        barTimer.isUserInteractionEnabled = false
        
        barTimer.transform = CGAffineTransform(rotationAngle: .pi / 2)
        barTimerRight.constant = -self.view.bounds.height / 5.5
        barTimerTop.constant = self.view.bounds.height / 5
        
        if(barTimer.value <= 6){
            barTimer.setThumbImage(UIImage(named: "\(thumbColor)ThumbMoon"), for: .normal)
        }else if(barTimer.value >= 19){
            barTimer.setThumbImage(UIImage(named: "\(thumbColor)ThumbMoon"), for: .normal)
        }else{
            barTimer.setThumbImage(UIImage(named: "\(thumbColor)ThumbSun"), for: .normal)
        }
        
    }
    
//MARK: Swipe Gesture
    
    @IBAction func screenSwipeUp(_ sender: Any) {
        
        UIView.animate(withDuration: 1){
            self.secondViewContraintTop.constant = -self.view.bounds.height / 1.6
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func screenSwipeDown(_ sender: Any) {
        UIView.animate(withDuration: 1){
            self.secondViewContraintTop.constant = 0
            self.view.layoutIfNeeded()
        }
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        UserDefaults.standard.set(todayUserInput.text, forKey: "todaySaved")
        print("Saved")
    }
}
