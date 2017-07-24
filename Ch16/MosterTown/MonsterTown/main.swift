//
//  main.swift
//  MonsterTown
//
//  Created by 宋 奎熹 on 2017/7/24.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Foundation

var myTown = Town()         //default initializer
let myTownSize = myTown.townSize
print(myTownSize)
myTown.changePopulation(by: 1_000_000)    //lazy property can only be computed ONCE
print("Size: \(myTown.townSize), population: \(myTown.population)")
print("Size Computational: \(myTown.townSizeComputational), population: \(myTown.population)")

//myTown.printDescription()   //instance method

//let genericMonster = Monster()
//genericMonster.town = myTown
//genericMonster.terrorizeTown()

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

let spookyNoise = Zombie.makeSpookyNoise()

print("Victim Pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("Victim Pool: \(fredTheZombie.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}
