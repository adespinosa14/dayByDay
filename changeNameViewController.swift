//
//  changeNameViewController.swift
//  Day by Day
//
//  Created by Andrew Espinosa on 8/18/22.
//

import UIKit

class changeNameViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonEntered(_ sender: Any) {
        if userInput.text == nil{
            let alert = UIAlertController(title: "Error", message: "Please Enter Name - Field Empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
            
        }else{
            newName.sharedInstance.name = userInput.text!
            newName.sharedInstance.newUser = 1
            
            UserDefaults.standard.set(newName.sharedInstance.newUser, forKey: "newUserSave")
            UserDefaults.standard.set(newName.sharedInstance.name, forKey: "nameSaved")
            
            let alert = UIAlertController(title: "Success", message: "Name Saved", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
