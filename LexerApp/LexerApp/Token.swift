//
//  Token.swift
//  LexerApp
//
//  Created by David Cormell on 13/03/2020.
//  Copyright © 2020 David Cormell. All rights reserved.
//

import Foundation

struct Token: Equatable {
    var type: TokenType
    var lexeme: String
}

enum TokenType {
    case WHILE;
    case INT;
    case DOUBLE;
    case STRING;
    case LEFT_PARENTHESIS;
    case RIGHT_PARENTHESIS;
    case LEFT_BRACE;
    case RIGHT_BRACE;
    case SEMI_COLON;
    case IDENTIFIER;
    case ASSIGN;
    case PLUS_ASSIGN;
    case PLUS;
    case LESS_THAN;
    case INT_LITERAL;
}
