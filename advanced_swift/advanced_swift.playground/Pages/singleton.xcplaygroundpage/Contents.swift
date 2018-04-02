//: [Previous](@previous)

import Foundation


// A singleton is an object which is instantialized exactly once.

class AccountManager {
    static var sharedInstance = AccountManager()
    
    var userInfo = (ID: "uchennathedev", Password: 1111)
    func network() {
        // get everything
        
    }
    
    private init() {
        /*  - Can't be used outside of the class definition
            - Can't create an instance/object of the class, especially
              if this is a model of a database or networking service.
         
         Application:
            - Using CoreData to make changes to the database
            - Creating a network request
         */
        
    }
}

AccountManager.sharedInstance.userInfo
let myAccountant = AccountManager.sharedInstance.userInfo.ID

// ViewController One
AccountManager.sharedInstance.userInfo.ID

// ViewController Two
AccountManager.sharedInstance.userInfo.ID = "uchenna"

// ViewController Three
AccountManager.sharedInstance.userInfo.ID = "uche"

// Examples of singleton: UIApplication, User Defualt, NSNotafication

















//: [Next](@next)
