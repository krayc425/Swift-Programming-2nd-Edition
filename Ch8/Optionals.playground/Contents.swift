//: Playground - noun: a place where people can play

import UIKit

var errorCodeString: String?
errorCodeString = "404"

print(errorCodeString)

if errorCodeString != nil {
    let theError = errorCodeString!     //! : Forced unwrapping
    print(theError)
}

//String? and String are different types!

//Optional Binding
if let theError = errorCodeString {
//    print(theError)
    if let errorCodeInteger = Int(theError) {
        print("\(theError): \(errorCodeInteger)")
    }
}
//to prevent Pyramid of Doom:
if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {
    print("\(theError): \(errorCodeInteger)")
}

//implicitly unwrapped optional
var errorCodeStringImp: String! = nil    //use ! instead of ?
//errorCodeStringImp = "404"
//print(errorCodeStringImp)
//let anotherErrorCodeString: String = errorCodeStringImp //Wrong!
let yetAnotherErrorCodeString = errorCodeStringImp

//Optional chaining
var errorDescripton: String?
if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {
    errorDescripton = "\(errorCodeInteger + 200): resource was not found"
}

var upperCaseErrorDescription = errorDescripton?.uppercased()   // ? marks the beginning of optional binding
errorDescripton
upperCaseErrorDescription?.append(" PLEASE TRY AGAIN")
upperCaseErrorDescription

errorDescripton = nil
let description = errorDescripton ?? "No error" //left object of ?? must be an optional
