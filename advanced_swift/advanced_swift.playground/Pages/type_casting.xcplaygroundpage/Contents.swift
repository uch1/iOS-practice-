/*
    Type Casting
*/

// Problem
// 1. How do you distinguish between as, as?, as!
// 2. Why does Xcode keep telling me what to do

import UIKit

// Upcasting/Converting from UIlabel to UIView
let label = UILabel() as UIView

// Design Class
class Human {
    func introduce() {
        print("Hi, I'm a human")
    }
}

class African: Human {
    func danceToSoco() {
        print("Dancing")
    }
}

let uchenna = African()
uchenna.introduce()
uchenna.danceToSoco()

// Type Casting
let newUchenna = uchenna as Human
newUchenna.introduce() // upcasting

//: > as --> Upcasting (Always works)

class American: Human {
    func doTheHarlemShake() {
        print("doTheHarlemShake")
    }
}

//:Upcasting with normal/common types
var name = "Uchenna" as Any
var age = 22 as Any

var anyArray = [name, age]
// Downcasting only occurs after upcasting
// Downcasting --> specific

//: ### Downcasting
//: Explicit/Force Downcasting

let newValue = anyArray[1] as! Int // normal type
//let anotherValue = anyArray[1] as! String

//: Implicit Downcasting (Safe)
let newNewValue = anyArray[0] as? Int
let anotherNewValue = anyArray[1] as? Int


let mom = African()
let obi = African()
let angel = African()
let matt = African()

var humans: [Human] = [mom, obi, angel, matt]
humans[0].introduce()

for human in humans {
    if let african = human as? African {
        african.danceToSoco()
    }
}


//: Practical Type Casting Usage
let loginButton = UIButton()
let loginMessage = UILabel()
let loginView = UIView()

let UIComponents = [loginButton, loginMessage, loginView]

for component in UIComponents {
    if let button = component as? UIButton {
        
    }
    
    if let label = component as? UILabel {
        
    }
    
    if let view = component as? UIView {
        
    }
}

// upcasting and downcasting aren't the most practical way in Ios
// Protocol Orient Programming is a "better" way

// Type Casting in UIKit
let storyboard = UIStoryboard(name: "Main", bundle: nil)
//let vc = storyboard.instantiateViewController(withIdentifier: "VC") as! VC























