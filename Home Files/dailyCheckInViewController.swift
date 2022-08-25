//
//  dailyCheckInViewController.swift
//  Day by Day
//
//  Created by Andrew Espinosa on 7/25/22.
//

import UIKit
import FSCalendar

class dailyCheckInViewController: UIViewController {

    @IBOutlet weak var daySlider: UISlider!
    @IBOutlet weak var daySliderNum: UILabel!
    @IBOutlet weak var userTextField: UITextView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var textFieldContraintDown: NSLayoutConstraint!
    @IBOutlet weak var firstQuestionLabel: UILabel!
    @IBOutlet weak var secondQuestionLabel: UILabel!
    @IBOutlet weak var submitButtonStyle: UIButton!
    @IBOutlet weak var moodNumber: UILabel!
    
    var tapped = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: Color Theme
        switch subscriptionType.sharedInstance.subType {
        case true:
                switch themeSelection.sharedInstance.selectedTheme{
                case 0:
                    //DEFAULT
                    firstQuestionLabel.textColor = UIColor(named: "defaultText")
                    secondQuestionLabel.textColor = UIColor(named: "defaultText")
                    daySlider.minimumTrackTintColor = UIColor(named: "defaultText")
                    moodNumber.textColor = UIColor(named: "defaultText")
                    
                    submitButtonStyle.backgroundColor = UIColor(named: "defaultPop")
                    userTextField.textColor = UIColor(named: "defaultPop")
                    userTextField.backgroundColor = UIColor(named: "defaultText")
                    self.view.backgroundColor = UIColor(named: "defaultBackground")
                    break
                    
                case 1:
                    //SUNSET
                    firstQuestionLabel.textColor = UIColor(named: "sunsetText")
                    secondQuestionLabel.textColor = UIColor(named: "sunsetText")
                    daySlider.minimumTrackTintColor = UIColor(named: "sunsetText")
                    moodNumber.textColor = UIColor(named: "sunsetText")
                    
                    submitButtonStyle.backgroundColor = UIColor(named: "sunsetPop")
                    userTextField.textColor = UIColor(named: "sunsetPop")
                    
                    userTextField.backgroundColor = UIColor(named: "sunsetText")
                    self.view.backgroundColor = UIColor(named: "sunsetBackground")
                    break
                    
                case 2:
                    //DUSK
                    firstQuestionLabel.textColor = UIColor(named: "duskText")
                    secondQuestionLabel.textColor = UIColor(named: "duskText")
                    daySlider.minimumTrackTintColor = UIColor(named: "duskText")
                    moodNumber.textColor = UIColor(named: "duskText")
                    
                    submitButtonStyle.backgroundColor = UIColor(named: "duskPop")
                    userTextField.textColor = UIColor(named: "duskPop")
                    
                    userTextField.backgroundColor = UIColor(named: "duskText")
                    self.view.backgroundColor = UIColor(named: "duskBackground")
                    break
                case 3:
                    //RAINFOREST
                    firstQuestionLabel.textColor = UIColor(named: "rainforestText")
                    secondQuestionLabel.textColor = UIColor(named: "rainforestText")
                    daySlider.minimumTrackTintColor = UIColor(named: "rainforestText")
                    moodNumber.textColor = UIColor(named: "rainforestText")
                    
                    submitButtonStyle.backgroundColor = UIColor(named: "rainforestPop")
                    userTextField.textColor = UIColor(named: "rainforestPop")
                    
                    userTextField.backgroundColor = UIColor(named: "rainforestText")
                    self.view.backgroundColor = UIColor(named: "rainforestBackground")
                    break
                case 4:
                    //UNDETERMINED ONE
                    firstQuestionLabel.textColor = UIColor(named: "undeterminedText")
                    secondQuestionLabel.textColor = UIColor(named: "undeterminedText")
                    daySlider.minimumTrackTintColor = UIColor(named: "undeterminedText")
                    moodNumber.textColor = UIColor(named: "undeterminedText")
                    
                    submitButtonStyle.backgroundColor = UIColor(named: "undeterminedPop")
                    userTextField.textColor = UIColor(named: "undeterminedPop")
                    
                    userTextField.backgroundColor = UIColor(named: "undeterminedBackground")
                    self.view.backgroundColor = UIColor(named: "undeterminedText")
                    break
                    
                case 5:
                    //UNDETERMINED TWO
                    firstQuestionLabel.textColor = UIColor(named: "undeterminedTwoText")
                    secondQuestionLabel.textColor = UIColor(named: "undeterminedTwoText")
                    daySlider.minimumTrackTintColor = UIColor(named: "undeterminedTwoText")
                    moodNumber.textColor = UIColor(named: "undeterminedTwoText")
                    
                    submitButtonStyle.backgroundColor = UIColor(named: "undeterminedTwoPop")
                    userTextField.textColor = UIColor(named: "undeterminedTwoPop")
                    
                    userTextField.backgroundColor = UIColor(named: "undeterminedTwoText")
                    self.view.backgroundColor = UIColor(named: "undeterminedTwoBackground")
                    
                default:
                    print("This Code Should Not Run")
                }
            
            break
        default:
            firstQuestionLabel.textColor = UIColor(named: "defaultText")
            secondQuestionLabel.textColor = UIColor(named: "defaultText")
            daySlider.minimumTrackTintColor = UIColor(named: "defaultText")
            moodNumber.textColor = UIColor(named: "defaultText")
            
            submitButtonStyle.backgroundColor = UIColor(named: "defaultPop")
            userTextField.textColor = UIColor(named: "defaultPop")
            userTextField.backgroundColor = UIColor(named: "defaultText")
            self.view.backgroundColor = UIColor(named: "defaultBackground")
        }
        
    }
    
//MARK: Slider
    
    @IBAction func daySliderMoved(_ sender: Any) {
        daySlider.value = round(daySlider.value)
        daySliderNum.text = String(Int(round(daySlider.value)))
        
        if(daySlider.value >= 8){
            mainImage.image = UIImage(named: "sun8-10")
        }else if(daySlider.value > 5){
            mainImage.image = UIImage(named: "cloud6-7")
        }else if(daySlider.value == 5){
            mainImage.image = UIImage(named: "cloud-5")
        }else if(daySlider.value < 5 && daySlider.value > 2){
            mainImage.image = UIImage(named: "cloud-rain-3-4")
        }else{
            mainImage.image = UIImage(named: "lightning-1-2")
        }
            
        
    }

//MARK: Submit Button
    
    @IBAction func submitButton(_ sender: Any) {
            
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        print(string)
        
        userInformationSavedData.sharedInstance.dates.append(string)
        userInformationSavedData.sharedInstance.userInfo.append(userTextField.text)
        userInformationSavedData.sharedInstance.images.append(Int(daySlider.value))
        
        UserDefaults.standard.setValue(userInformationSavedData.sharedInstance.dates,  forKey: "datesSaved")
        UserDefaults.standard.setValue(userInformationSavedData.sharedInstance.userInfo ,  forKey: "userInfoSaved")
        UserDefaults.standard.setValue(userInformationSavedData.sharedInstance.images, forKey: "imageSaved")
        print(userInformationSavedData.sharedInstance.userInfo)
        print(userInformationSavedData.sharedInstance.images)
        print(userInformationSavedData.sharedInstance.dates)
        
        let alert = UIAlertController(title: "Save Successful", message: "Your Save was successful. Check it out in the calendar!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay!", style: .default)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
//MARK: Touches Began
    
    @IBAction func textFieldTapped(_ sender: Any) {
        
        textFieldContraintDown.constant = -50
        
        if(tapped == 0){
            self.userTextField.becomeFirstResponder()
            userTextField.text = nil
            tapped += 1
        }else{
            self.userTextField.becomeFirstResponder()
            print("Already initially tapped")
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        textFieldContraintDown.constant = 40
    }
}
