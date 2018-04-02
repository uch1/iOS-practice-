//: [Previous](@previous)

import Foundation

/*
    The delegate Pattern
 Problem: How does delegate even work?
 
 Note: Purpose of Delegate: Communicate/Pass Data between objects
*/

// Goal: Send data from FirstVC to SecondVC

// tableView.delegate = self
// collectionView.delegate = self

// Ex CEO and Secretary Relationship

//: Design Protocol
protocol PassDataDelegate {
    func passData(data: String)
}

//: Design Delegator (Sender)
class FirstVC {
    var delegate: PassDataDelegate?
}

//: Design Delegate (Receiver)
class SecondVC: PassDataDelegate {
    func passData(data: String) {
        print("The CEO gave me \(data)")
    }
}

//: Create object
let firstVC = FirstVC()
let secondVC = SecondVC()

//: Assign Delegate
firstVC.delegate = secondVC
firstVC.delegate?.passData(data: "bunch of contracts")

//: Practical Example in iOS
import UIKit

class UchennaViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello")
        // animation
        // go to the next view controller
    }
    
}





//: [Next](@next)
