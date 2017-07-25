//
//  main.swift
//  MonsterTown
//
//  Created by 宋 奎熹 on 2017/7/24.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Foundation

//var myTown = Town()          //empty initializer
var myTown = Town(region: "West", population: 10_000, stoplights: 6) //memberwise initializer
var myTown2 = Town(population: 10_000, stoplights: 6)                //use delegate initializer
let myTownSize = myTown?.townSize
print(myTownSize ?? "Town is nil")
myTown?.changePopulation(by: 1_000_000)    //lazy property can only be computed ONCE
print("Size: \(String(describing: myTown?.townSize)), population: \(String(describing: myTown?.population))")
print("Size Computational: \(String(describing: myTown?.townSizeComputational)), population: \(String(describing: myTown?.population))")

//myTown.printDescription()   //instance method

//let genericMonster = Monster()
//genericMonster.town = myTown
//genericMonster.terrorizeTown()

//let fredTheZombie = Zombie()    //default class initializer
var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")    //inherited class initializer
//fredTheZombie.town = myTown
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()

let spookyNoise = Zombie.makeSpookyNoise()

print("Victim Pool: \(String(describing: fredTheZombie?.victimPool))")
fredTheZombie?.victimPool = 500
print("Victim Pool: \(String(describing: fredTheZombie?.victimPool))")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}

var convenientZombie = Zombie(limp: true, fallingApart: false)

fredTheZombie = nil //deinitializer

let noNameMonster = Monster(town: myTown, monsterName: "")
