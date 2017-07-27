//: Playground - noun: a place where people can play

import UIKit

protocol Exercise: CustomStringConvertible {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}

extension Exercise {    //extend protocol with a property
    var description: String {
        return "Exercise(\(name), burned \(caloriesBurned) calories in \(minutes) minutes."
    }
}

extension Exercise {
    var title: String {
        return "\(name) - \(minutes) minutes"
    }
}

struct EllipticalWorkout: Exercise {
    let name = "Elliptical Workout"
    let caloriesBurned: Double
    let minutes: Double
    let title = "Workout using the Go Fast Elliptical Trainer 3000"
}

let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 335, minutes: 30)

struct TreadmillWorkout: Exercise {
    let name = "Treadmill Workout"
    let caloriesBurned: Double
    let minutes: Double
    let laps: Double
    var description: String {   //override default implementation, its priority is supreme to default one
        return "Exercise(\(name), burned \(caloriesBurned) calories and \(laps) laps in \(minutes) minutes."
    }
}

let runningWorkout = TreadmillWorkout(caloriesBurned: 350, minutes: 25, laps: 10.5)

//use generic method to calculate calories per minute
//func caloriesBurnerPerMinute<E: Exercise>(for exercise: E) -> Double {
//    return exercise.caloriesBurned / exercise.minutes
//}
//print(caloriesBurnerPerMinute(for: ellipticalWorkout))
//print(caloriesBurnerPerMinute(for: runningWorkout))

//OR
//extention on protocols
extension Exercise {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}
print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

//extetion on protocols with where clause
extension Sequence where Iterator.Element == Exercise {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [Exercise] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())

print(ellipticalWorkout)
print(runningWorkout)

for exercise in mondayWorkout {     //here, we just know the exercise conform Exercise, thus using the "title" property in protocol extension
    print(exercise.title)
}
print(ellipticalWorkout.title)      //here, we know the type of exercise (EllipticalWorkout), so using the "title" property in EllipticalWorkout
