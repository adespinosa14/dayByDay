//
//  iapPageViewViewController.swift
//  Day by Day
//
//  Created by Andrew Espinosa on 8/17/22.
//

import UIKit
import Purchases

class iapPageViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchOfferings()
        
        Purchases.shared.purchaserInfo { info, error in
            guard let info = info, error == nil else{return}
            if info.entitlements.all["Pro"]?.isActive == true{
                    
                    subscriptionType.sharedInstance.subType = true
                    UserDefaults.standard.set(subscriptionType.sharedInstance.subType, forKey: "subTypeSave")
                    print("PURCHASE SUCCESSFULLY DONE")
                
            }else{
                DispatchQueue.main.async {
                    print("NOT SUBSCRIBED")
                }
            }
            
        }
        
    }

    func fetchPackage(completion: @escaping (Purchases.Package) -> Void){
        Purchases.shared.offerings { offerings, error in
            guard let offerings = offerings, error == nil else{return}
            print(offerings.all)
//            guard let package = offerings.all.first?.value.package(identifier: "Pro") else {return}
//            print(package)
            
            guard let package = offerings.all.first?.value.availablePackages.first else{return}
            completion(package)
            
            }
        }
    
    func purchase(package: Purchases.Package){
        Purchases.shared.purchasePackage(package) { [weak self] transaction, info, error, userCancelled in
            guard let transaction = transaction, let info = info, error == nil, !userCancelled else{return}
            
            print(transaction.transactionState)
            print(info.entitlements)
            
            if info.entitlements.all["Pro"]?.isActive == true{
                    
                    subscriptionType.sharedInstance.subType = true
                    UserDefaults.standard.set(subscriptionType.sharedInstance.subType, forKey: "subTypeSave")
                    print("PURCHASE SUCCESSFULLY DONE")
                
            }else{
                DispatchQueue.main.async {
                    print("NOT SUBSCRIBED")
                }
            }
            
        }
    }
    
    func restorePurchases(){
        Purchases.shared.restoreTransactions{ [weak self] info, error in
            guard let info = info, error == nil else {return}

            
                if info.entitlements.all["Pro"]?.isActive == true{
                        
                        subscriptionType.sharedInstance.subType = true
                        UserDefaults.standard.set(subscriptionType.sharedInstance.subType, forKey: "subTypeSave")
                        print("PURCHASE SUCCESSFULLY DONE")
                    
                }else{
                    DispatchQueue.main.async {
                        print("NOT SUBSCRIBED")
                    }
                }
                
            
        }
    }
    
    @IBAction func purchasePressed(_ sender: Any) {
        fetchPackage { [weak self] package in
            self?.purchase(package: package)
        }
    }
    
    
    @IBAction func restoreButton(_ sender: Any) {
        restorePurchases()
    }
    
    @IBAction func termsOfService(_ sender: Any) {
        
        if let url = URL(string: "https://docs.google.com/document/d/e/2PACX-1vSp033znrpPqpiTf1P2C0lHyTHNjcK5X1KKx1L-Qy0P0ktwDXSXESoq3h2BaDgHjqFIORlbV4HrspSR/pub") {
            UIApplication.shared.open(url)
        }
        
    }
    
    @IBAction func privacyPolicy(_ sender: Any) {
        if let url = URL(string: "https://docs.google.com/document/d/e/2PACX-1vSAzl0OKijSe4QItncS8Lm82130dlxRpJZSujjeoO552sWzhY7vKqADocO6b-UHhFmWF5TygUMUc87i/pub") {
            UIApplication.shared.open(url)
        }
    }
    
}
