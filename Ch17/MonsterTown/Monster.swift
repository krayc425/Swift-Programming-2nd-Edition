//
//  Monster.swift
//  MonsterTown
//
//  Created by 宋 奎熹 on 2017/7/24.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Foundation

class Monster {
    static let isTerrifying = true
    class var spookyNoise: String {
        return "Grrr..."
    }
    var town: Town?
//    var name = "Monster"
    var name: String
    var victimPool: Int {   //a read-write computational property
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    required init?(town: Town?, monsterName: String) {    //designated initializer
        self.town = town
        guard monsterName != "" else {
            print("This monster doesn't have a name.")
            return nil
        }
        name = monsterName
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
