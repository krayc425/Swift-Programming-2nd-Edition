//: Playground - noun: a place where people can play

import UIKit

var movieRatings = ["Donnie Darko" : 4, "Chungking Express" : 5, "Dark City" : 4]
print("I have rated \(movieRatings.count) movies")

let darkoRating = movieRatings["Donnie Darko"]
let braveheartRating = movieRatings["Braveheart"]

movieRatings["Dark City"] = 5
movieRatings
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")   //can save old value
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    print("Old rating \(lastRating), current rating \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5 //add value
movieRatings.removeValue(forKey: "Dark City")   //remove value
let removedRating: Int? = movieRatings.removeValue(forKey: "Dark City")
movieRatings["Dark City"] = nil //remove value method 2
movieRatings

for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value).")
}

for movie in movieRatings.keys {
    print("User has rated \(movie).")
}

//immutable dictionary
let album = ["Diet Roast Beef" : 268,
             "Dubba Dubbs Stubs His Toe" : 467]
album["Diet Roast Beef"] = 444     //Wrong!

let watchedMovies = Array(movieRatings.keys)

