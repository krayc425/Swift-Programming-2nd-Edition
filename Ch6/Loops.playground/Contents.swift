//: Playground - noun: a place where people can play

import UIKit

var myFirstInt: Int = 0

for i in 1...5 {
    myFirstInt += 1
    myFirstInt
    print("myFirstInt equals \(myFirstInt) at iteration \(i)")
}

for _ in 1...5 {    // use _ to ignore iterator
    myFirstInt += 1
    myFirstInt
    print(myFirstInt)
}

for i in 1...100 where i % 3 == 0 { // where clause in for-in loop
    print(i)
}

var i = 1
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}

//repeat-while
i = 1
repeat {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
} while i < 6

var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0
while shields > 0 {
    if spaceDemonsDestroyed == 500 {
        print("You beat the game")
        break       //break
    }
    
    if blastersOverheating {
        print("Blasters are overheated.")
        sleep(5)
        print("Blasters ready to fire")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue        //continue
    }
    
    print("Fire")
    
    blasterFireCount += 1
    spaceDemonsDestroyed += 1
}
