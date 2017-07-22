//: Playground - noun: a place where people can play

import Cocoa

//var numberOfStoplights = "Four"
//numberOfStoplights += 2   // Wrong

// Type annotation
//var numberOfStoplights: Int = 4
//numberOfStoplights += 2

let numberOfStoplights: Int = 4 // Constant
//numberOfStoplights += 2   // Wrong

var population: Int
population = 5422
let townName: String = "Knowhere"
let townUnemployed: Double = 0.13321
//String interpolation
let townDescription = "\(townName) has a population of \(population) and \(numberOfStoplights) stoplights, with an unemployed rate of \(townUnemployed)."
print(townDescription)
