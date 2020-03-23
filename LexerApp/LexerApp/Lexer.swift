//
//  Lexer.swift
//  LexerApp
//
//  Created by David Cormell on 13/03/2020.
//  Copyright © 2020 David Cormell. All rights reserved.
//

import Foundation

class Lexer {
    func lex(text: String) -> [Token] {
        //implement lexical analysis in this method. Remember it should:
        //remove whitespace
        let array = text.map{$0}
        var newText = ""
        var finalArray = [Token]()
        for char in array {
            if char != " " {
                newText = newText + String(char)
            } else {
                finalArray.append(Token(type: .IDENTIFIER, lexeme: text))
                newText = ""
            }
        }
        //produce an ordered sequence of tokens / lexemes
        return finalArray
    }
}
