//
//  Town.swift
//  MonsterTown
//
//  Created by 宋 奎熹 on 2017/7/24.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Foundation

struct Town {
    let region : String//read-only type property
    var mayer: Mayer = Mayer()
    var population: Int {    //read-write stored property
        didSet(oldPopulation) { //property observation
            if oldPopulation > population {
                print("The population has changed to \(population) from \(oldPopulation).")
                mayer.printDecreasingPopulationInfo()
            }
        }
    }
    var numberOfStoplights: Int
    
    init?(region: String, population: Int, stoplights: Int) {   //init? means failable initializer
        guard population > 0 else {
            return nil
        }
        self.region = region
        self.population = population
        numberOfStoplights = stoplights
    }
    
    init?(population: Int, stoplights: Int) {    //initiliazer delegation
        self.init(region: "N/A", population: population, stoplights: stoplights)
    }
    
    enum Size { //nested type
        case small
        case medium
        case large
    }
    lazy var townSize: Size = { //lazy loading property
        switch self.population {
        case 0...10_000:
            return Size.small
        case 10_001...100_000:
            return Size.medium
        default:
            return Size.large
        }
    }()
    
    //use myTown.townSizeComputational to access this property
    var townSizeComputational: Size {    //computational property
        get {
            switch self.population {
            case 0...10_000:
                return Size.small
            case 10_001...100_000:
                return Size.medium
            default:
                return Size.large
            }
        }
    }
    
    func printDescription() {
        print("Population: \(population), number of stoplights: \(numberOfStoplights), region \(region)")
    }
    
    //if you would like to change value in the struct, use mutating
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
}

