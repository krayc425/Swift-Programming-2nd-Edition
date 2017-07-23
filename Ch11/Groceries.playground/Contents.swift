//: Playground - noun: a place where people can play

import UIKit

var groceryBag = Set<String>()
groceryBag.insert("Apple")
groceryBag.insert("Oranges")
groceryBag.insert("Pineapple")

for food in groceryBag {
    print(food)
}

//or
var groceryBag2: Set = ["Apple", "Oranges", "Pinapple"]

for food in groceryBag2 {
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")

//union
let friendsGroceryBag = Set["Bananas", "Cereal", "Milk", "Oranges"]
let commonGroceryBag = groceryBag.union(friendsGroceryBag)
//intersection
let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)

let yourSecondBag = Set(["Berries", "Yogurt"])
let roommatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roommatesSecondBag)   //where is disjoint?
