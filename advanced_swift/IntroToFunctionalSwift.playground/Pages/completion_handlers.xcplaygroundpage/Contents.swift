//: [Previous](@previous)

import Foundation

// Problem: I've heard about it. I don't knwo how to one.

/*
 
 Definition: Do something when something has been done
 
 
 Completion Handler Used?
 1. Notify the download has been completed
 2. Animation
*/

 // Design Handler Block
let myHandlerBlock: (Bool) -> () = { (isSuccessful) in
    if isSuccessful {
        print("Download has been done")
    }
}

let myHandlerBlock2: (Bool) -> () = {
    if $0 {
        print("Download has been done")
    }
}

//// Design Function
//func downloadAnImage(completionBlock: (Bool) -> Void) {
//    for _ 1...100 {
//        print("Downloading")
//    }
//
//    completionBlock(true)
//}
//
//// pass closure indirectly
//downloadAnImage(completionBlock: myHandlerBlock)
//
//// pass closure directly
//downloadAnImage(completionBlock: { (isSuccessful) in
//    if isSuccessful {
//        print("Done downloading")
//    }
//})


let handler: ([String]) -> Void = { (array) in
    print("Done working \(array)")
}

func workSuperHard(doneStuffBlock: ([String]) -> Void) {
    for _ 1...100 {
        print("You can do it")
    }
}

































//: [Next](@next)
