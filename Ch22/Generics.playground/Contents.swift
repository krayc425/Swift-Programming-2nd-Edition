//: Playground - noun: a place where people can play

import UIKit

struct StackIterator<T>: IteratorProtocol {
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

struct Stack<Element>: Sequence {     //a generic stack
    var items = [Element]()
    
    mutating func pushAll<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        for item in sequence {
            self.push(item)
        }
    }
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(_ f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
    
    func filter(_ f: (Element) -> Bool) -> Stack<Element> {
        var mappedItems = [Element]()
        for item in items {
            if f(item) {
                mappedItems.append(item)
            }
        }
        return Stack<Element>(items: mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
}

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackIterator = StackIterator(stack: myStack)
while let value = myStackIterator.next() {
    print("got \(value)")
}

for value in myStack {
    print("for-in loop: got \(value)")
}
myStack.pushAll([1, 2, 3])
for value in myStack {
    print("after pushing: got \(value)")
}

var myOtherStack = Stack<Int>()
myOtherStack.pushAll([1, 2, 3])
myStack.pushAll(myOtherStack)
for value in myStack {
    print("after pushing items onto stack: got \(value)")
}

for value in myStack.filter({ $0 % 2 == 0 }) {
    print("after filtering items: got \(value)")
}

var intStack = Stack<Int>() //specialization
intStack.push(1)
intStack.push(2)
var doubleStack = intStack.map { 2 * $0 }

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

print(doubleStack.pop())
print(doubleStack.pop())

var stringStack = Stack<String>()
stringStack.push("This is a string.")
stringStack.push("Another string.")

print(stringStack.pop())

//generic functions / methods
func myMap<T, U>(_ items: [T], _ f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLength = myMap(strings, { $0.characters.count })
print(stringLength)

//type constraint
func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}
print(checkIfEqual(1, 1))
print(checkIfEqual("str", "str"))
print(checkIfEqual("str", "another str"))

func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}
print(checkIfDescriptionsMatch(Int(1), Int(1)))
print(checkIfDescriptionsMatch(1, 1.0))
print(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))
