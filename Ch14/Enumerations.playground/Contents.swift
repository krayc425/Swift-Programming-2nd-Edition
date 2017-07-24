//: Playground - noun: a place where people can play

import UIKit

//enum is value type, not reference type
enum TextAlignment: Int {    //as a new type, with raw value
    case left       = 20
    case right      = 30
    case center     = 40
    case justify    = 50
}

var alignment = TextAlignment.left
alignment = .right

print("Left has raw value = \(TextAlignment.left.rawValue)")
print("Right has raw value = \(TextAlignment.right.rawValue)")
print("Center has raw value = \(TextAlignment.center.rawValue)")
print("Justify has raw value = \(TextAlignment.justify.rawValue)")

let myRawValue = 10
if let myAlignment = TextAlignment(rawValue: myRawValue) {  //returns TextAlignment?
    print("Successfully converted \(myAlignment) to a TextAlignment")
} else {
    print("\(myRawValue) has no corresponding TextAlignment case")
}

if alignment == .right {
    print("We should right-align the text.")
}

//switch in enum, should avoid default branch
switch alignment {
case .left:
    print("left aligned")
case .right:
    print("right aligned")
case .center:
    print("center aligned")
case .justify:
    print("justified")
}

enum ProgrammingLanguage: String {
    case swift  //default raw value is same as the value itself
    case objectiveC = "objective-c"
    case c
    case cpp        = "c++"
    case java
}
let myFavoriteLanguage = ProgrammingLanguage.swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")

//method in enum
enum Lightbulb {
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperatue ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    
    mutating func toggle() {    //add "mutating" to permit this method to change value of self
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var bulb = Lightbulb.on
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperatue: ambientTemperature)
print("The bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperature(forAmbientTemperatue: ambientTemperature)
print("The bulb's temperature is \(bulbTemperature)")

//relating value
enum ShapeDimensions {
    case point
    case square(side: Double)
    case rectangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return 4 * side
        case let .rectangle(width: w, height: h):
            return 2 * (w + h)
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5.0, height: 8.0)
var pointShape = ShapeDimensions.point

print("Square's perimeter = \(squareShape.perimeter())")
print("Rectangle's perimeter = \(rectShape.perimeter())")
print("Point's perimeter = \(pointShape.perimeter())")

print("Square's area = \(squareShape.area())")
print("Rectangle's area = \(rectShape.area())")
print("Point's area = \(pointShape.area())")

enum FamilyTree {
    case noKnownParents
    indirect case oneKnownParent(name: String, ancestors: FamilyTree)   //mark recursive member as indirect
    indirect case twoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.twoKnownParents(fatherName: "fred Sr.",
                                               fatherAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents),
                                               motherName: "Marsha",
                                               motherAncestors: .noKnownParents)
