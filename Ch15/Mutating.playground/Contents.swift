//: Playground - noun: a place where people can play

import UIKit

func greet(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}

let personalGreeting = greet(name: "Swift", withGreeting: "Hello, ")
print(personalGreeting)

func greeting(forName name: String) -> (String) -> String {
    func greeting(_ greeting: String) -> String {
        return "\(greeting) \(name)"
    }
    return greeting
}

let greetMattWith = greeting(forName: "Matt")
let mattGreeting = greetMattWith("Hello, ")
print(mattGreeting)

//use closure

func greeting2(_ greeting: String) -> (String) -> String {
    return { (name: String) -> String in
        return "\(greeting) \(name)"
    }
}
let friendlyGreetingFor = greeting2("Hello, ")
let mattGreeting2 = friendlyGreetingFor("Matt")
print(mattGreeting2)

struct Person {
    var firstName = "Matt"
    var lastName = "Mathias"
    
    mutating func changeTo(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var p = Person()
let changeName = Person.changeTo
let changeNameFromMattTo = changeName(p)
changeNameFromMattTo("John", "Gallagher")
p.firstName
p.lastName

p.changeTo(firstName: "John", lastName: "Gallagher")
p.firstName
p.lastName
