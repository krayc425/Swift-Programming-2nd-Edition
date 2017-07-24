//
//  Zombie.swift
//  MonsterTown
//
//  Created by 宋 奎熹 on 2017/7/24.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Foundation

class Zombie: Monster {     //inheritance
    var walksWithLimp = true
    
    final override func terrorizeTown() {     //override super class's method, use 'override'; and use 'final' to prevent child class's overriding
        if (town?.population)! >= 10 {
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
