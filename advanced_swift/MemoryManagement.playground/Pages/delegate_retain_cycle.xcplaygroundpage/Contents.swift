//: Playground - noun: a place where people can play
import Foundation

/*
 Delegate Retain Cycle
 
 Problem: Why delegate should be weak var
 */

protocol SendDataDelegate: class {}

class SendingVC {
    var delegate: SendDataDelegate?
    
    deinit {
        print("Delegator gone")
    }
}

class ReceivingVC: SendDataDelegate {
    lazy var sendingVC: SendingVC = {
        let vc = SendingVC()
        vc.delegate = self
        return vc
    }()
    
    deinit {
        print("Delegate gone")
    }
}


/*
 Note:
 - A weak reference allows the referencing object to becoming nil (this happens automatically when the referenced object is deallocated)
 - Based on the rule above, the referencing object/variable must be optional
*/
