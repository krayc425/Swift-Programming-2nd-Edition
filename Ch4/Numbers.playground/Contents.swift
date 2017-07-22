//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

//Int : 64-bit
print("The maximum Int value is \(Int.max)")
print("The minimum Int value is \(Int.min)")
//Int32
print("The maximum Int-32 value is \(Int32.max)")
print("The minimum Int-32 value is \(Int32.min)")
//Int8, Int16, Int64...

//UInt : 64-bit
print("The maximum UInt value is \(UInt.max)")
print("The minimum UInt value is \(UInt.min)")
//UInt32
print("The maximum UInt-32 value is \(UInt32.max)")
print("The minimum UInt-32 value is \(UInt32.min)")

let numberOfPages: Int = 10
let numberOfChapters = 3

let numberOfPeople: UInt = 100
let volumeAdjustment: Int32 = -1000

print(10 + 20)
print(30 - 5)
print(5 * 3)
print(10 + 2 * 5)
print(30 - 5 * 5)
print((10 + 2) * 5)
print(30 - (5 - 5))
//Integer division,向0舍入
print(11 / 3)
print(-11 / 3)
print(11 % 3)
print(-11 % 3)

var x = 10
x += 10
x -= 5

//Overflow:
let y: Int8 = 120
//let z = y + 10   //Wrong!
let z = y &+ 10     //Overflow Operator, &+ &- &*
print("120 &+ 10 is \(z)")

let a: Int16 = 200
let b: Int8 = 50
//let c = a + b   //Wrong!
let c = a + Int16(b)

let d1 = 1.1    //Implicity Double
let d2: Double = 1.1
let d3: Float = 100.3

print(10.0 + 11.4)
print(11.0 / 3.0)

if d1 == d2 {
    print("d1 and d2 are the same")
}

print("d1 + 0.1 is \(d1 + 0.1)")

if d1 + 0.1 == 1.2 {
    print("d1 + 0.1 is equal to 1.2")
}
