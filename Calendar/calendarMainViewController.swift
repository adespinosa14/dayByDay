//
//  calendarMainViewController.swift
//  Day by Day
//
//  Created by Andrew Espinosa on 7/26/22.
//

import UIKit
import FSCalendar
import CloudKit

class calendarMainViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainDate: UILabel!
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet weak var userInputData: UITextView!
    
    var timer = Timer()
    var runCount = 0
    let informationData = userInformationSavedData.sharedInstance.userInfo
    let datesInfo = userInformationSavedData.sharedInstance.dates
    var dateIndex = 0
    var dateIndexTwo = 0
    var foundDate = 0
    var imageCalc = 0
    var informationIndex = 0
    //MARK: View Did Appear
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImage.isHidden = true
        mainDate.isHidden = true
        userInputData.isHidden = true
        dateIndexTwo = 0
        calendar.delegate = self
        calendar.dataSource = self
        
        calendar.appearance.titleFont = .boldSystemFont(ofSize: 16)
        
    //MARK: Theme Colors
        switch subscriptionType.sharedInstance.subType{
        case true:
                switch themeSelection.sharedInstance.selectedTheme{
                case 0:
                    //DEFAULT
                    calendar.appearance.headerTitleColor = UIColor(named: "defaultPop")
                    calendar.appearance.weekdayTextColor = UIColor(named: "defaultPop")
                    calendar.appearance.titleSelectionColor = UIColor(named: "defaultPop")
                    calendar.appearance.todayColor = UIColor(named: "defaultPop")
                    calendar.appearance.eventDefaultColor = UIColor(named: "defaultPop")
                    calendar.appearance.eventSelectionColor = UIColor(named: "defaultPop")
                    
                    calendar.appearance.titleDefaultColor = UIColor(named: "defaultText")
                    calendar.appearance.selectionColor = UIColor(named: "defaultText")
                    userInputData.textColor = UIColor(named: "defaultText")
                    mainDate.textColor = UIColor(named: "defaultText")
                    
                    calendar.backgroundColor = UIColor(named: "defaultBackground")
                    userInputData.backgroundColor = UIColor(named: "defaultBackground")
                    self.view.backgroundColor = UIColor(named: "defaultBackground")
                    break
                    
                case 1:
                    //SUNSET
                    calendar.appearance.headerTitleColor = UIColor(named: "sunsetPop")
                    calendar.appearance.weekdayTextColor = UIColor(named: "sunsetPop")
                    calendar.appearance.titleSelectionColor = UIColor(named: "sunsetPop")
                    calendar.appearance.todayColor = UIColor(named: "sunsetPop")
                    calendar.appearance.eventDefaultColor = UIColor(named: "sunsetPop")
                    calendar.appearance.eventSelectionColor = UIColor(named: "sunsetPop")
                    
                    calendar.appearance.titleDefaultColor = UIColor(named: "sunsetText")
                    calendar.appearance.selectionColor = UIColor(named: "sunsetText")
                    userInputData.textColor = UIColor(named: "sunsetText")
                    mainDate.textColor = UIColor(named: "sunsetText")
                    
                    calendar.backgroundColor = UIColor(named: "sunsetBackground")
                    userInputData.backgroundColor = UIColor(named: "sunsetBackground")
                    self.view.backgroundColor = UIColor(named: "sunsetBackground")
                    break
                    
                case 2:
                    //DUSK
                    calendar.appearance.headerTitleColor = UIColor(named: "duskPop")
                    calendar.appearance.weekdayTextColor = UIColor(named: "duskPop")
                    calendar.appearance.titleSelectionColor = UIColor(named: "duskPop")
                    calendar.appearance.todayColor = UIColor(named: "duskPop")
                    calendar.appearance.eventDefaultColor = UIColor(named: "duskPop")
                    calendar.appearance.eventSelectionColor = UIColor(named: "duskPop")
                    
                    calendar.appearance.titleDefaultColor = UIColor(named: "duskText")
                    calendar.appearance.selectionColor = UIColor(named: "duskText")
                    userInputData.textColor = UIColor(named: "duskText")
                    mainDate.textColor = UIColor(named: "duskText")
                    
                    calendar.backgroundColor = UIColor(named: "duskBackground")
                    userInputData.backgroundColor = UIColor(named: "duskBackground")
                    self.view.backgroundColor = UIColor(named: "duskBackground")
                    break
                case 3:
                    //RAINFOREST
                    calendar.appearance.headerTitleColor = UIColor(named: "rainforestPop")
                    calendar.appearance.weekdayTextColor = UIColor(named: "rainforestPop")
                    calendar.appearance.titleSelectionColor = UIColor(named: "rainforestPop")
                    calendar.appearance.todayColor = UIColor(named: "rainforestPop")
                    calendar.appearance.eventDefaultColor = UIColor(named: "rainforestPop")
                    calendar.appearance.eventSelectionColor = UIColor(named: "rainforestPop")
                    
                    calendar.appearance.titleDefaultColor = UIColor(named: "rainforestText")
                    calendar.appearance.selectionColor = UIColor(named: "rainforestText")
                    userInputData.textColor = UIColor(named: "rainforestText")
                    mainDate.textColor = UIColor(named: "rainforestText")
                    
                    calendar.backgroundColor = UIColor(named: "rainforestBackground")
                    userInputData.backgroundColor = UIColor(named: "rainforestBackground")
                    self.view.backgroundColor = UIColor(named: "rainforestBackground")
                    break
                case 4:
                    //UNDETERMINED ONE
                    calendar.appearance.headerTitleColor = UIColor(named: "undeterminedPop")
                    calendar.appearance.weekdayTextColor = UIColor(named: "undeterminedPop")
                    calendar.appearance.titleSelectionColor = UIColor(named: "undeterminedPop")
                    calendar.appearance.todayColor = UIColor(named: "undeterminedPop")
                    calendar.appearance.eventDefaultColor = UIColor(named: "undeterminedPop")
                    calendar.appearance.eventSelectionColor = UIColor(named: "undeterminedPop")
                    
                    calendar.appearance.titleDefaultColor = UIColor(named: "undeterminedText")
                    calendar.appearance.selectionColor = UIColor(named: "undeterminedText")
                    userInputData.textColor = UIColor(named: "undeterminedText")
                    mainDate.textColor = UIColor(named: "undeterminedText")
                    
                    calendar.backgroundColor = UIColor(named: "undeterminedBackground")
                    userInputData.backgroundColor = UIColor(named: "undeterminedBackground")
                    self.view.backgroundColor = UIColor(named: "undeterminedBackground")
                    break
                    
                case 5:
                    //UNDETERMINED TWO
                    calendar.appearance.headerTitleColor = UIColor(named: "undeterminedTwoPop")
                    calendar.appearance.weekdayTextColor = UIColor(named: "undeterminedTwoPop")
                    calendar.appearance.titleSelectionColor = UIColor(named: "undeterminedTwoPop")
                    calendar.appearance.todayColor = UIColor(named: "undeterminedTwoPop")
                    calendar.appearance.eventDefaultColor = UIColor(named: "undeterminedTwoPop")
                    calendar.appearance.eventSelectionColor = UIColor(named: "undeterminedTwoPop")
                    
                    calendar.appearance.titleDefaultColor = UIColor(named: "undeterminedTwoText")
                    calendar.appearance.selectionColor = UIColor(named: "undeterminedTwoText")
                    userInputData.textColor = UIColor(named: "undeterminedTwoText")
                    mainDate.textColor = UIColor(named: "undeterminedTwoText")
                    
                    calendar.backgroundColor = UIColor(named: "undeterminedTwoBackground")
                    userInputData.backgroundColor = UIColor(named: "undeterminedTwoBackground")
                    self.view.backgroundColor = UIColor(named: "undeterminedTwoBackground")
                    
                default:
                    print("This Code Should Not Run")
                }
            
            break
        default:
            
            calendar.appearance.headerTitleColor = UIColor(named: "defaultPop")
            calendar.appearance.weekdayTextColor = UIColor(named: "defaultPop")
            calendar.appearance.titleSelectionColor = UIColor(named: "defaultPop")
            calendar.appearance.todayColor = UIColor(named: "defaultPop")
            
            calendar.appearance.titleDefaultColor = UIColor(named: "defaultText")
            calendar.appearance.selectionColor = UIColor(named: "defaultText")
            userInputData.textColor = UIColor(named: "defaultText")
            mainDate.textColor = UIColor(named: "defaultText")
            
            calendar.backgroundColor = UIColor(named: "defaultBackground")
            userInputData.backgroundColor = UIColor(named: "defaultBackground")
            self.view.backgroundColor = UIColor(named: "defaultBackground")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        runCount = 0
        print(userInformationSavedData.sharedInstance.userInfo)
        print(userInformationSavedData.sharedInstance.images)
        print(userInformationSavedData.sharedInstance.dates)
        print("Sub Type: \(subscriptionType.sharedInstance.subType)")
        
    }
    
//MARK: Calendar data
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        mainDate.text = String(string)
            
        if(userInformationSavedData.sharedInstance.dates.contains(string)){
            dateIndexTwo = 0
            mainImage.isHidden = false
            mainDate.isHidden = false
            userInputData.isHidden = false
            
            while (dateIndexTwo < userInformationSavedData.sharedInstance.dates.count){
                if(userInformationSavedData.sharedInstance.dates[dateIndexTwo] == string){
                    foundDate = dateIndexTwo
                }
                
                dateIndexTwo += 1
            }
            
            print(foundDate)
            imageCalc = userInformationSavedData.sharedInstance.images[foundDate]
            userInputData.text = userInformationSavedData.sharedInstance.userInfo[foundDate]
            
            if(imageCalc >= 8){
                mainImage.image = UIImage(named: "sun8-10")
            }else if(imageCalc > 5){
                mainImage.image = UIImage(named: "cloud6-7")
            }else if(imageCalc == 5){
                mainImage.image = UIImage(named: "cloud-5")
            }else if(imageCalc < 5 && imageCalc > 2){
                mainImage.image = UIImage(named: "cloud-rain-3-4")
            }else{
                mainImage.image = UIImage(named: "lightning-1-2")
            }
        }else{
            mainImage.isHidden = true
            mainDate.isHidden = true
            userInputData.isHidden = true
        }
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let formatter = DateFormatter()
        let formatterTwo = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        formatterTwo.dateFormat = "dd"
        let string = formatter.string(from: date)
        
        if(userInformationSavedData.sharedInstance.dates.contains(string)){
            return 1
        }
        return 0
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendar, fillDefaultColorFor date: Date) -> UIColor?{
        
        return UIColor.red
    }
}
