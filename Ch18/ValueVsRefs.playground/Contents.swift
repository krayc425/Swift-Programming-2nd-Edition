//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var playgroundStr = str
//String is a struct, thus is a value type
playgroundStr += "! How are you today?"
str

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate
//Class uses reference type
anotherHecate.name = "AnotherHecate"
anotherHecate.name
hecate.name

struct Pantheon {
    var chiefGod: GreekGod
}
let pantheon = Pantheon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")
//pantheon.chiefGod = zeus      //Wrong! Value type cannot be changed, even its properties are "var"
zeus.name = "Zeus Jr."
zeus.name   //zeus refers to an instance of GreekGod, and change the name property doesn't affect this

pantheon.chiefGod.name
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.chiefGod.name
//So, do not use reference type in a value type in most cases!

//Copy in Swift is swallow copy
let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]

let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy
//gods and godsCopy share the same reference to one instance
//Swallow copy just copy the reference, instead of creating a same copy

//Difference between Equality and Identity
let x = 1
let y = 1
x == y      //true
//x === y     //Wrong!
athena === hecate   //false
//athena == hecate     //Wrong! GreekGod must comform Equatable


