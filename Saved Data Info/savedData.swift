//
//  savedData.swift
//  Day by Day
//
//  Created by Andrew Espinosa on 8/10/22.
//

import Foundation
import UIKit
import Purchases

class userInformationSavedData{
    var dates = [String]()
    var userInfo = [String]()
    var images = [Int]()
    
    class var sharedInstance: userInformationSavedData{
        struct singleton{
            static var instance = userInformationSavedData()
        }
        return singleton.instance
    }
    
    init() {
        
        switch UserDefaults.standard.object(forKey: "datesSaved") == nil && UserDefaults.standard.object(forKey: "userInfoSaved") == nil && UserDefaults.standard.object(forKey: "imageSaved") == nil{
        case true:
            print("No Item In Cart")
        default:
            dates = UserDefaults.standard.object(forKey: "datesSaved") as! Array
            userInfo = UserDefaults.standard.object(forKey: "userInfoSaved") as! Array
            images = UserDefaults.standard.object(forKey: "imageSaved") as! Array
        }
    }
}

class subscriptionType{
    
    var subType = false
    
    class var sharedInstance: subscriptionType{
        struct singleton{
            static var instance = subscriptionType()
        }
        return singleton.instance
    }
    
    init(){
        switch UserDefaults.standard.object(forKey: "subTypeSave") == nil{
        case true:
            print("Subscription Type Does not Exist: False")
            break;
        default:
            subType = UserDefaults.standard.object(forKey: "subTypeSave") as! Bool
        }
    }
}

class themeSelection{
    var selectedTheme = 0
    
    class var sharedInstance: themeSelection{
        struct singleton{
            static var instance = themeSelection()
        }
        return singleton.instance
    }
    
    init(){
        switch UserDefaults.standard.object(forKey: "selectedThemeSave") == nil{
        case true:
            print("Default Theme")
            break;
        default:
            selectedTheme = UserDefaults.standard.object(forKey: "selectedThemeSave") as! Int
        }
    }
}


class newName {
    var newUser = 0
    var name = String()
    
    class var sharedInstance: newName{
        struct singleton{
            static var instance = newName()
        }
        return singleton.instance
    }
    
    init(){
        switch UserDefaults.standard.object(forKey: "newUserSave") == nil && UserDefaults.standard.object(forKey: "nameSaved") == nil {
        case true:
            print("User is brand new to the app")
        default:
            newUser = UserDefaults.standard.object(forKey: "newUserSave") as! Int
            name = UserDefaults.standard.object(forKey: "nameSaved") as! String
        }
    }
}
