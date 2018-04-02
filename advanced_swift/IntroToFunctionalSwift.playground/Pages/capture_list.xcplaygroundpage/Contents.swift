//: [Previous](@previous)

import Foundation
// Capture Lists: will prepare you for memory management

var a = 0
var b = 0

// Design Closure
let newClosure = { print(a, b) }()

// Design Closure Array
var closureArray: [() -> ()] = []
var i = 0
for _ in 1...5 {
    closureArray.append {
        print()
    }
    i += 1
}

closureArray[0]() // 5
closureArray[1]() // 5

// Characteristic of Closure: Reference Type

var c = 0
var d = 0

let smartClosure: () -> () = { () in
    print(c, d)
}
smartClosure()
c = 9
d = 9

smartClosure() // (9, 9)

/*
    Capture list
 Note: Don't reference, Copy
*/

let smarterClosure: () -> () = { [c, d] in
    print(c, d)
}

smarterClosure() // (9, 9)

c = 10
d = 10


//: Design Closure Array
var smartClosureArray: [() -> ()] = []
var j = 0

for _ in 1...5 {
    smartClosureArray.append { [j] in
        print(j)
    }
    j += 1
}

smartClosureArray[0]()
smartClosureArray[1]()
smartClosureArray[2]()
















//: [Next](@next)
