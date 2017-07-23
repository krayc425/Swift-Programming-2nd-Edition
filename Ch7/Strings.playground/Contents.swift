//: Playground - noun: a place where people can play

import UIKit

let playground = "Hello, playground"

var mutablePlayground = "Hello, mutable playground"

mutablePlayground += "!"
//Swift string is combination of Character type, it represents Unicode scalar
for c: Character in mutablePlayground.characters {
    print("'\(c)'")
}

let oneCoolDude = "\u{1F60E}"   // \u{} represents Unicode scalar
let aAcute = "\u{0061}\u{0301}" // two \u{} represent combining scalar

for scalar in playground.unicodeScalars {
    print("\(scalar.value)")
}

let aAcutePrecomposed = "\u{00E1}"

let b = aAcute == aAcutePrecomposed //Canonical equivalence

print("aAcute: \(aAcute.characters.count); aCutePrecomposed: \(aAcutePrecomposed.characters.count)")

let start = playground.startIndex
let end = playground.index(start, offsetBy: 4)
let fifthCharacter = playground[end]
let range = start...end
let firstFive = playground[range]

