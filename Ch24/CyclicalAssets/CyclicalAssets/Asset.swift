//
//  Asset.swift
//  CyclicalAssets
//
//  Created by 宋 奎熹 on 2017/7/27.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Foundation

class Asset: CustomStringConvertible {
    let name: String
    let value: Double
    weak var owner: Person? //use weak keyword to avoid strong reference cycle
    
    var description: String {
        if let actualOwner = owner {
            return "Asset(\(name), worth \(value), owned by \(actualOwner).)"
        } else {
            return "Asset(\(name), worth \(value), not owned by anyone.)"
        }
    }
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
    
    deinit {
        print("\(self) is being deallocated.")
    }
}
