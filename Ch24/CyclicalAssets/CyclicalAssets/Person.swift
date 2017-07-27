//
//  Person.swift
//  CyclicalAssets
//
//  Created by 宋 奎熹 on 2017/7/27.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    var assets = [Asset]() 
    
    var description: String {
        return "Person(\(name))"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            [weak self] netWorth in
            
            self?.netWorthDidChange(to: netWorth)
            return
        }
    }
    
    func takeOwnership(of asset: Asset) {
        accountant.gained(asset) {
            asset.owner = self
            assets.append(asset)
        }
    }
    
    func netWorthDidChange(to netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth).")
    }
    
    func useNetWorthCHangedHandler(handler: @escaping (Double) -> Void) {   //marked as escaping closure
        accountant.netWorthChangedHandler = handler
    }
    
    deinit {
        print("\(self) is being deallocated.")
    }
}
