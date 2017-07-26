//: Playground - noun: a place where people can play

import UIKit

enum Token {
    case number(Int)    //enum related value
    case plus
}

class Lexer {
    enum Error: Swift.Error {   //use Swift.Error to prevent namespace error
        case invalidCharacter(Character)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past endIndex!")  //assertion
        position = input.index(after: position)
    }
    
    func getNumebr() -> Int {
        var value = 0
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                let digitValue = Int(String(nextCharacter))!    //caution to use '!'
                value = 10 * value + digitValue
                advance()
            default:
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                let value = getNumebr()
                tokens.append(.number(value))
            case "+":
                tokens.append(.plus)
                advance()
            case " ":
                advance()
            default:
                throw Lexer.Error.invalidCharacter(nextCharacter)   //throw an Error
            }
        }
        
        return tokens
    }
}

class Parser {
    enum Error: Swift.Error {
        case unexceptedEndOfInput
        case invalidToken(Token)
    }
    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Parser.Error.unexceptedEndOfInput
        }
        
        switch token {
        case .number(let value):
            return value
        case .plus
            throw Parser.Error.invalidToken(token)
        }
    }
    
    func parse() throws -> Int {
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            case .plus:
                let nextNumber = getNumber()
                value += nextNumber
            case .number:
                throw Parser.Error.invalidToken(token)
            }
        }
        
        return value
    }
}

func evaluate(_ input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    let tokens = try! lexer.lex()    //this is ok, but we should avoid this try!
    
    do {
        let tokens = try lexer.lex()    //every "throwable" block must have a "try"
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        guard let tokens = try? parser.parse() else {   //use guard and try? to prevent error, but we should avoid this too
            print("Parsing failed, but I don't know why.")
            return
        }
        print("Parser result: \(result)")
    } catch Lexer.Error.invalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.unexceptedEndOfInput {
        print("Unexpected end of input during parsing.")
    } catch Parser.Error.invalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch {
        print("An error occurred: \(error)")
    }
}

evaluate("10 + 2 + 3")
