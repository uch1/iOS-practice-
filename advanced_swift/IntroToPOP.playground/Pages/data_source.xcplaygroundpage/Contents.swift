//: [Previous](@previous)

import Foundation
/*
 Data Source
 Problem: Bi-Directional Communication
 
 Note: Purpose of Data Source: Communicate (Backward) from SecondVC(Delegate) to FirstVC(Delegator)
*/

// Ex CEO and Secretary Relationship

//: Design Protocol
protocol PassDataDataSource {
    func passData(data: String) -> String
}

//: Design Delegator (Sender/CEO)
class FirstVC {
    var delegate: PassDataDataSource?
}

//: Design Delegate (Receiver/Secretary)
class SecondVC: PassDataDelegate {
    func passData(data: String) -> String {
        print("The CEO gave me \(data)")
        return "I'm too tired..."
    }
}

//: Create object
let firstVC = FirstVC()
let secondVC = SecondVC()

//: Assign Delegate
firstVC.delegate = secondVC
let message = firstVC.delegate?.passData(data: "bunch of contracts")
print(message)

//: Practical Example in iOS
import UIKit

class UchennaViewController: UIViewController, UITableViewDataSource {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
}

/*
 ### UIKit Examples
 - UIApplication
 - UITableView
 - UICollectionView 
*/







//: [Next](@next)
