//: Playground - noun: a place where people can play

import UIKit

struct Point: Comparable, CustomStringConvertible { //Comparable is inherited from Equatable
    let x: Int
    let y: Int
    
    var description: String {
        return "Point(x: \(x), y: \(y))"
    }
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
        
    static func <(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x < rhs.x) && (lhs.y < rhs.y)
    }
    
    static func +(lhs: Point, rhs: Point) -> Point {
        return Point(x: (lhs.x + rhs.x), y: (lhs.y + rhs.y))
    }
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
let abEqual = (a == b)
let abNotEqual = (a != b)
    
let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

let cdEqual = (c == d)
let cLessThanD = (c < d)
let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)

let e = a + b
let f = c + d
print(e)
print(f)

//self-definition operator
class Person {
    var name: String
    weak var spouse: Person?
    
    init(name: String, spouse: Person?) {
        self.name = name
        self.spouse = spouse
    }
    
    //However, we should avoid self-define new operators
    func marry(_ spouse: Person) {
        self.spouse = spouse
        spouse.spouse = self
    }
}

let matt = Person(name: "Matt", spouse: nil)
let drew = Person(name: "Drew", spouse: nil)

//new infix operator
infix operator +++

func +++(lhs: Person, rhs: Person) {
    lhs.spouse = rhs
    rhs.spouse = lhs
}

matt +++ drew

matt.spouse?.name
drew.spouse?.name
