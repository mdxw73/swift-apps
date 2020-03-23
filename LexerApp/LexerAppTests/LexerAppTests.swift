//
//  LexerAppTests.swift
//  LexerAppTests
//
//  Created by David Cormell on 13/03/2020.
//  Copyright © 2020 David Cormell. All rights reserved.
//

import XCTest
@testable import LexerApp

class LexerAppTests: XCTestCase {
    
    func expectedTokensProgramA() -> [Token] {
        return [Token(type: TokenType.INT, lexeme: "int"),
        Token(type: TokenType.IDENTIFIER, lexeme: "a"),
        Token(type: TokenType.ASSIGN, lexeme: "="),
        Token(type: TokenType.INT_LITERAL, lexeme: "1")]
    }
    
    func expectedTokensProgramB() -> [Token] {
        return [Token(type: TokenType.WHILE, lexeme: "while"),
        Token(type: TokenType.LEFT_PARENTHESIS, lexeme: "("),
        Token(type: TokenType.IDENTIFIER, lexeme: "y"),
        Token(type: TokenType.LESS_THAN, lexeme: "<"),
        Token(type: TokenType.IDENTIFIER, lexeme: "z"),
        Token(type: TokenType.RIGHT_PARENTHESIS, lexeme: ")"),
        Token(type: TokenType.LEFT_BRACE, lexeme: "{"),
        Token(type: TokenType.INT, lexeme: "int"),
        Token(type: TokenType.IDENTIFIER, lexeme: "x"),
        Token(type: TokenType.ASSIGN, lexeme: "="),
        Token(type: TokenType.IDENTIFIER, lexeme: "a"),
        Token(type: TokenType.PLUS, lexeme: "+"),
        Token(type: TokenType.IDENTIFIER, lexeme: "b"),
        Token(type: TokenType.SEMI_COLON, lexeme: ";"),
        Token(type: TokenType.IDENTIFIER, lexeme: "y"),
        Token(type: TokenType.PLUS_ASSIGN, lexeme: "+="),
        Token(type: TokenType.IDENTIFIER, lexeme: "x"),
        Token(type: TokenType.SEMI_COLON, lexeme: ";"),
        Token(type: TokenType.RIGHT_BRACE, lexeme: "}"),]
    }

    func testLexWithProgramAReturnsCorrectTokens() {
        //arrange
        let filePath = Bundle.main.path(forResource: "programA", ofType: "dpc")
        let lexer = Lexer()
        let expected = expectedTokensProgramA()
        
        guard let source_code = try? String(contentsOfFile: filePath!) else {
            print("Error, cannot find test file, unable to execute test.")
            return
        }
        
        //act
        let tokens = lexer.lex(text: source_code)
        
        //assert
        XCTAssertEqual(tokens, expected)
        
    }
        
    func testLexWithProgramBReturnsCorrectTokens() {
        //arrange
        let filePath = Bundle.main.path(forResource: "programB", ofType: "dpc")
        let lexer = Lexer()
        let expected = expectedTokensProgramB()
        
        guard let source_code = try? String(contentsOfFile: filePath!) else {
            print("Error, cannot find test file, unable to execute test.")
            return
        }
        
        //act
        let tokens = lexer.lex(text: source_code)
        
        //assert
        XCTAssertEqual(tokens, expected)
        
    }

}
