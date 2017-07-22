//: Playground - noun: a place where people can play

import UIKit

var statusCode: Int = 418
var errorString: String = "The request failed with the error:"

//Range matching
switch statusCode {
case 100, 101:
    errorString += " Informational, \(statusCode)."
case 204:
    errorString += " Successful but no content, \(statusCode)."
case 300...307:
    errorString += " Redirection, \(statusCode)."
case 400...417:
    errorString += " Client error, \(statusCode)."
case 500...505:
    errorString += " Server error, \(statusCode)."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:      //where clause
    errorString = "\(unknownCode) is not a known error code."
//case let unknownCode:   //Value binding
default:
    errorString = "Unexcepted error encountered."
}

//tuple
let error = (statusCode, errorString)
error.0
error.1
let errorWithName = (code: statusCode, error: errorString)
errorWithName.code
errorWithName.error

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("No items found")
case (404, _):      // _ : match any value
    print("First item not found")
case (_, 404):
    print("Second item not found")
default:
    print("All items found")
}

//fallthrough
switch statusCode {
case 400, 401, 403, 404:
    errorString = "There was seomthing wrong with the request."
    fallthrough
default:
    errorString = errorString + " Please review the request and try again."
}

// if ... case
let age = 25
if case 18...35 = age {
    print("Cool demographic")
}

if case 18...35 = age, age >= 21, age < 30 {    //use , to list multiple conditions
    print("In cool demographic and of drinking age")
}
