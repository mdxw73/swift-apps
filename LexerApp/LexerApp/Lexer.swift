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
        }
        return .IDENTIFIER
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
            finalArray.append(Token(type: getType(newText), lexeme: newText))
        }
        //produce an ordered sequence of tokens / lexemes
        return finalArray
    }
}
