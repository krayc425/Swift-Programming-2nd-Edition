//: Playground - noun: a place where people can play

import UIKit

func printGreeting() {  // == func printGreeting() -> Void  and  func printGreeting() -> ()
    print("Hello, playground")
}
printGreeting()

func printPersonalGreetings(to names: String...) {  //variadic   //outer paramter: to
    for name in names {
        print("Hello \(name), welcome to your playground")
    }
}
printPersonalGreetings(to: "KrayC", "Alex", "Chris")

func divisionDescriptionFor(numerator: Double,
                            denominator: Double,
                            withPunctuation puctuation: String = ".") -> String { //default parameter value
    return "\(numerator) divided by \(denominator) equals \(numerator / denominator)\(puctuation)"
}
print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0))    //use default value
print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!"))  //use my value

//in-out parameter: can change value of outer argument
var error = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {  //_ means ignore the parameter name
    if code == 400 {
        errorString += " bad request"
    }
}
appendErrorCode(400, toErrorString: &error)
error

//嵌套
func areaOfTriangleWith(base: Double, height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}
areaOfTriangleWith(base: 3.0, height: 4.0)

//Multiple return values
func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)    //return a named tuple as multiple values
}

let aBunchOfNumbers = [10,1,4,3,57,43,24,546,134,235]
let theSortedNumers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The odd numbers are \(theSortedNumers.odds) and the even numbers are  \(theSortedNumers.evens)")

//Optional return value
func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Matt", "HH", "Mathias"))
if let theName = middleName {
    print(theName)
}

func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle, middleName.characters.count >= 4 else {   //guard statement
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}
greetByMiddleName(fromFullName: ("Matt", "FFFFF", "Mathias"))

let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortedEvenOddNumbers


