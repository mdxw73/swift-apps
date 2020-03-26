//
//  Lexer.swift
//  LexerApp
//
//  Created by David Cormell on 13/03/2020.
//  Copyright © 2020 David Cormell. All rights reserved.
//

import Foundation

class Lexer {
    
    func getType(_ text: String) -> TokenType {
        if let _ = Int(text) {
            return .INT_LITERAL
        } else if let _ = Double(text) {
            return .DOUBLE
        } else if text == "=" {
            return .ASSIGN
        } else if text == "int" {
            return .INT
        } else if text == "while" {
            return .WHILE
        } else if text == "+=" {
            return .PLUS_ASSIGN
        } else if text == "+" {
            return .PLUS
        } else if text == "<" {
            return.LESS_THAN
        }
        return .IDENTIFIER
    }
    func decompose(_ newText: String) -> (TokenType?, Int?) {
        let newTextArray = newText.map {$0}
        var type: TokenType? = nil
        var index: Int? = nil
        for char in newTextArray {
            switch char {
            case "(":
                type = TokenType.LEFT_PARENTHESIS
                index = newTextArray.firstIndex(of: char)
            case ")":
                type = TokenType.RIGHT_PARENTHESIS
                index = newTextArray.firstIndex(of: char)
            case "{":
                type = TokenType.LEFT_BRACE
                index = newTextArray.firstIndex(of: char)
            case "}":
                type = TokenType.RIGHT_BRACE
                index = newTextArray.firstIndex(of: char)
            case ";":
                type = TokenType.SEMI_COLON
                index = newTextArray.firstIndex(of: char)
            default:
                continue
            }
        }
        return (type, index)
    }
    
    func lex(text: String) -> [Token] {
        //implement lexical analysis in this method. Remember it should:
        //remove whitespace
        let refined = text.trimmingCharacters(in: CharacterSet.newlines)
        let array = refined.components(separatedBy: " ")
        var finalArray = [Token]()
        var newText = ""
        for component in array {
            newText = component.trimmingCharacters(in: CharacterSet.newlines)
            
            newText.removeAll {$0 == "\n"}
            
            var result = decompose(newText)
            var type = result.0
            var index = result.1
            
            while index == 0 {
                let first = String(newText.first!)
                newText.removeFirst()
                finalArray.append(Token(type: type!, lexeme: first))
                
                result = decompose(newText)
                type = result.0
                index = result.1
            }
            
            var tempArray: [(TokenType, String)] = []
            
            while index == newText.count-1 {
                let last = String(newText.last!)
                newText.removeLast()
                tempArray.append((type!, last))
                
                result = decompose(newText)
                type = result.0
                index = result.1
            }
            
            if newText.count > 0 {
                finalArray.append(Token(type: getType(newText), lexeme: newText))
            }
            
            for temp in tempArray.reversed() {
                finalArray.append(Token(type: temp.0, lexeme: temp.1))
            }
            
        }
        //produce an ordered sequence of tokens / lexemes
        return finalArray
    }
}
