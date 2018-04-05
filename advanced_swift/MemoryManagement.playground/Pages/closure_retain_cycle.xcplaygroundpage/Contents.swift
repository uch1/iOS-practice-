//: [Previous](@previous)

import Foundation

/*
 Closure Retain Cycle
 
 Problem:
        1. How to use capture lists to prevent retain cycle in closures
        2. When to use unowned
 */


class UchennaClass {
    var uchennaClosure: (() -> ())?
    var name: String = "uchenna"
    
    init() {
        uchennaClosure = { [weak self] in
            guard let object = self else {
                return
            }
            
            print("\(object.name) the Developer")
        }
    }
    
    deinit {
        print("UchennaClass gone")
    }
}

var uchennaClass: UchennaClass? = UchennaClass()
uchennaClass?.uchennaClosure!()

/*
 However, the capture self within the closure has turned into an optional type. Let us review the rule of weak.
 
 1. A weak reference allows the referencing object to becoming nil (this happens automatically when the referenced object is deallocated)
 2. Based on the rule above, the referencing object/variable must be optional
*/








//: [Next](@next)
