//
//  Sentiment.swift
//  CommentCardWriter
//
//  Created by Zack Obied on 06/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class Sentiment {
    
    let effort: Bool
    let enjoyment: Bool
    let weakness: String
    let strength: String
    
    init(effort: Bool, enjoyment: Bool, weakness: String, strength: String) {
        self.effort = effort
        self.enjoyment = enjoyment
        self.weakness = weakness
        self.strength = strength
    }
    
}
