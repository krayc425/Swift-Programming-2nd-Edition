//: Playground - noun: a place where people can play

import UIKit

protocol TabularDataSource {
    var numberOfRows: Int { get }   //need readonly property
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    
    func itemFor(row: Int, column: Int) -> String
}

//Original printTable
//func printTable(_ data: [[String]], withColumnLabels columnLabels: String...) {
//    var firstRow = "|"
//
//    var columnWidths = [Int]()
//
//    for columnLabel in columnLabels {
//        let columnHeader = " \(columnLabel) |"
//        firstRow += columnHeader
//        columnWidths.append(columnLabel.characters.count)
//    }
//    print(firstRow)
//
//    for row in data {
//        var out = "|"
//
//        for (j, item) in row.enumerated() {
//            let paddingNeeded = columnWidths[j] - item.characters.count
//            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
//            out += " \(padding)\(item) |"
//        }
//
//        print(out)
//    }
//}

//Too difficult to use
//let data = [
//    ["Joe", "30", "6"],
//    ["Karen", "40", "10"],
//    ["Fred", "50", "20"],
//]
//
//printTable(data, withColumnLabels: "Employee Name", "Age", "Years of Experience")

//New printTable, uses TabularDataSource
func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {    //protocol composition
    print("Table: \(dataSource.description)")
    
    var firstRows = [String]()
    var otherRows = [String]()
    var columnWidths = [Int]()
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        columnWidths.append(columnLabel.characters.count)
        firstRows.append(columnLabel)
    }
    
    for i in 0 ..< dataSource.numberOfRows {
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            let width = columnWidths[j]
            let length = item.characters.count
            if width < length {
                columnWidths[j] = length
            }
        }
    }
    
    for i in 0 ..< dataSource.numberOfRows {
        var out = "|"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            let width = columnWidths[j]
            let length = item.characters.count
            let paddingNeededFirstRow = width - firstRows[j].characters.count
            if i == 0 {
                firstRows[j] = "| " + repeatElement(" ", count: paddingNeededFirstRow).joined(separator: "") + firstRows[j] + " "
            }
            let paddingNeeded = width - length
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        otherRows.append(out)
    }
    
    print(firstRows.joined(separator: "") + "|")
    for row in otherRows {
        print(row)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible { //conform multiple protocolsxw
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    //TabularDataSource Protocol
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0:
            return "Employee Name"
        case 1:
            return "Age"
        case 2:
            return "Years of Experience"
        default:
            fatalError("Invalid Column")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0:
            return person.name
        case 1:
            return String(person.age)
        case 2:
            return String(person.yearsOfExperience)
        default:
            fatalError("Invalid Column")
        }
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(department)

struct Book {
    let name: String
    let author: String
    let rating: Double
}

struct BookCollection: TabularDataSource, CustomStringConvertible {
    var name: String
    var books = [Book]()
    
    var description: String {
        return "BookList (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addBook(_ book: Book) {
        books.append(book)
    }
    
    //TabularDataSource Protocol
    
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0:
            return "Book Name"
        case 1:
            return "Author"
        case 2:
            return "Amazon Rating"
        default:
            fatalError("Invalid Column")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
        case 0:
            return book.name
        case 1:
            return book.author
        case 2:
            return String(book.rating)
        default:
            fatalError("Invalid Column")
        }
    }
}

var bookList = BookCollection(name: "New Book List")
bookList.addBook(Book(name: "Game of Thrones", author: "N/A", rating: 8.5))
bookList.addBook(Book(name: "Friends", author: "N/A", rating: 9.6))
bookList.addBook(Book(name: "The Planet of Apes", author: "N/A", rating: 7.9))
printTable(bookList)
