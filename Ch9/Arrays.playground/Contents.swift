//: Playground - noun: a place where people can play

import UIKit

//var bucketList: Array<String>
//var bucketList: [String]      //these 2 lines are equivalent

var bucketList: [String] = ["Climb Mt. Everest"]
bucketList.append("Fly hot air balloon ro Fiji")    //add an element
bucketList.append("Watch Lord of Rings Trilogy in a day")
bucketList.append("Go on a walkabout")
bucketList.append("Find a triple rainbow")
bucketList.append("Scuba dive in the Great Blue Hole")
bucketList.remove(at: 2)    //remove an element

print(bucketList.count)
print(bucketList[0...2])    //print elements in a range
print(bucketList[4])        //print single element

bucketList[2] += " in Australia"    //modify an element
bucketList[0] = "Climb Mt. Kilimanjaro" //replace an element

var newItems = [
    "Fly hot air balloon ro Fiji",
    "Watch Lord of Rings Trilogy in a day",
    "Go on a walkabout",
    "Find a triple rainbow",
    "Scuba dive in the Great Blue Hole"
]
for item in newItems {
    bucketList.append(item)
}
bucketList += newItems  //use += to append multiple items
bucketList.insert("Toboggan across Alaska", at: 2)

bucketList

let array1 = ["1", "2", "3"]
var array2 = ["1", "3", "2"]
let bool1 = array1 == array2
array2 = ["1", "2", "3"]
let bool2 = array1 == array2

//immutable array
let lunches = [
                "CheeseBurger",
                "Veggie Pizza",
                "Chicken Caesar Salad",
                "Black Bea burrito"
              ]
lunches.isEmpty
lunches.reversed()
lunches

bucketList
let index1 = bucketList.index(of: "Toboggan across Alaska")
bucketList[index1! + 2]

