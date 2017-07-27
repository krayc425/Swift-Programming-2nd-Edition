//
//  Zombie.swift
//  MonsterTown
//
//  Created by 宋 奎熹 on 2017/7/24.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Foundation

class Zombie: Monster {     //inheritance
    override class var spookyNoise: String {    //use override to override super class type property
        return "Brains..."
    }
    var walksWithLimp = true
    private(set) var isFallingApart = false    //internal getter, private setter
    
    final override func terrorizeTown() {     //override super class's method, use 'override'; and use 'final' to prevent child class's overriding
        if (town?.population)! >= 10, !isFallingApart {
            town?.changePopulation(by: -10)
        }
        super.terrorizeTown()
    }
    
    //class method
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
    
    //these 2 class methods cannot be overridden
    final class func cannotOverrideMethod_1() -> String {
        return "Brains..."
    }
    
    static func cannotOverrideMethod_2() -> String {
        return "Brains..."
    }
}
