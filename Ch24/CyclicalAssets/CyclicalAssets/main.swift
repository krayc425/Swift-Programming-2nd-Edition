//
//  main.swift
//  CyclicalAssets
//
//  Created by 宋 奎熹 on 2017/7/27.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Foundation

//all reference are strong reference by default
var bob: Person? = Person(name: "Bob")
print("Created \(bob)")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1_500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.0)

bob?.useNetWorthCHangedHandler(handler: { netWorth in
    print("Bob's net worth is now \(netWorth).")
})
bob?.takeOwnership(of: laptop!) //these 2 lines will create strong reference cycle, which causes memory leak!!!
bob?.takeOwnership(of: hat!)

print("While Bob is alive, hat's owner is \(hat!.owner).")
bob = nil
print("Bob variable is now \(bob).")
print("After Bob is deallocated, hat's owner is \(hat!.owner).")

laptop = nil
hat = nil
backpack = nil
