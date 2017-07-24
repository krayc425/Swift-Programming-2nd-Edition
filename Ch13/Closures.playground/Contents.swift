//: Playground - noun: a place where people can play

import UIKit

let volunteerCounts = [1,3,50,32,2,53,77,13]

//all functions are closures
func sortAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}

let volunteerSorted = volunteerCounts.sorted(by: sortAscending)

//codes above are equivalent to:

let volunteerSortedClosure = volunteerCounts.sorted(by: {
    (i: Int, j: Int) -> Bool in
    return i < j
})
volunteerSortedClosure

//codes above are equivalent to:

let volunteerSortedClosureSimplified = volunteerCounts.sorted(by: { i, j in i < j })
volunteerSortedClosureSimplified

//codes above are equivalent to:

let volunteerSortedClosureSimplifiedWithFastParameterName = volunteerCounts.sorted { $0 < $1 }  //trailing closure syntax


//Functions as return values
//func makeTownGrand() -> (Int, Int) -> Int {
//    func buildRoads(byAddingLight lights: Int,
//                    toExistingLight existingLights: Int) -> Int {
//        return lights + existingLights
//    }
//    return buildRoads
//}
//
//var stopLights = 4
//let townPlanByAddingLightsToExistingLights = makeTownGrand()
//stopLights = townPlanByAddingLightsToExistingLights(4, stopLights)
//print("Knowhere has \(stopLights) stopLights.")


//Functions as parameters
func makeTownGrand(withBudget budget: Int,
                   condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {   //And return a function
    if condition(budget) {
        func buildRoads(byAddingLight lights: Int,
                        toExistingLights existingLights: Int) -> Int {
            return lights + existingLights
        }
        return buildRoads
    } else {
        return nil
    }
}
func evaluate(budget: Int) -> Bool {
    return budget > 10_000
}

var stoplights = 4
if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 1_000, condition: evaluate) {
    stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
}
print("Knowhere has \(stoplights) stoplights.")

if let newTownPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 10_500, condition: evaluate) {
    stoplights = newTownPlanByAddingLightsToExistingLights(4, stoplights)
}
print("Knowhere has \(stoplights) stoplights.")


func makePopulationTracker(forInitialPopulation population: Int) -> (Int) -> Int {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return population
    }
    return populationTracker
}
var currentPopulation = 5_422
let growBy = makePopulationTracker(forInitialPopulation: currentPopulation)
growBy(500)
growBy(500)
growBy(500)
currentPopulation = growBy(500)

//Closures are reference type
let anotherGrowBy = growBy
anotherGrowBy(500)

var bigCityPopulation = 4_061_981
let bigCityGrowBy = makePopulationTracker(forInitialPopulation: bigCityPopulation)
bigCityPopulation = bigCityGrowBy(19_000)
currentPopulation

//Higher-order function
let precinctPopulations = [3131,1244,2021,2157]
let projectedPopulations = precinctPopulations.map {
    (poplation: Int) -> Int in
    return poplation * 2
}
projectedPopulations

let bigProjections = projectedPopulations.filter {
    (projection: Int) -> Bool in
    return projection > 4000
}
bigProjections

let totalProjection = projectedPopulations.reduce(0) {
    (accumulatedProjection: Int, precinctPopulation: Int) -> Int in
    return accumulatedProjection + precinctPopulation
}
let totalProjectionSimplified = projectedPopulations.reduce(0) { $0 + $1 }

totalProjection

precinctPopulations.sorted()

